import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ihust/models/Class.dart';
import 'package:ihust/utils/services.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  @override
  ClassState get initialState => ClassState.init();

  @override
  Stream<ClassState> mapEventToState(ClassEvent event,
  ) async* {
    if (event is LoadClassesByStudentId) {
      yield* _loadClassesByUserId(userId: event.userId);
    }
  }
  Stream<ClassState> _loadClassesByUserId({String userId}) async* {
    yield state.update(isLoading: true);
    AppServices services =
        new AppServices(action: "classes&studentid=$userId", body: null);
    APIResult result;
    List<Class> classes = new List();
    Map<int, List<Class>> mapScholarYear = new Map<int, List<Class>>();
    try {
      result = await services.get();
      if (result is APISuccess) {
        List<dynamic> res = result.data['data'];
        for (var i = 0; i < res.length; i++) {
          Map<String, dynamic> mapClass = res[i];
          Class item = Class.fromJS(mapClass);
          classes.add(item);
          if (mapScholarYear.containsKey(item.scholarYear)) {
            mapScholarYear.update(item.scholarYear, (values) {
              values.add(item);
              return values;
            });
          } else {
            mapScholarYear.putIfAbsent(item.scholarYear, () => [item]);
          }
        }
        classes.sort((a,b) => int.parse(a.semester) - int.parse(b.semester));
        print("hahaha,: " + mapScholarYear.keys.toString());
        yield state.update(classes: classes,mapScholarYear: mapScholarYear);
      } else if (result is APIError) {
        yield state.update(error: result);
      }
    } catch (e) {}
  }
}
