import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ihust/blocs/classes/class_bloc.dart';
import 'package:ihust/models/Class.dart';
import 'package:ihust/utils/services.dart';
import 'package:ihust/utils/utils.dart';

part 'tabletime_event.dart';
part 'tabletime_state.dart';

class TabletimeBloc extends Bloc<ClassEvent, ClassState> {
//  List<List<Class>> classesByDay;
  @override
  ClassState get initialState => ClassState.init();

  @override
  Stream<ClassState> mapEventToState(ClassEvent event,) async* {
    if (event is LoadClassesByStudentId) {
      yield* _loadClassesByStudentId(userId: event.userId);
    }
    // TODO: implement mapEventToState
  }

  Stream<ClassState> _loadClassesByStudentId({String userId}) async* {
    yield state.update(isLoading: true);
    APIResult result;
    String sessionId = await ClientUtils.getDeviceDetails();
    AppServices services =
    new AppServices(action: "classes&sessionid=$sessionId", body: null);

    List<Class> classes = new List();
    Map<int, List<Class>> mapSchoolarYear = new Map<int, List<Class>>();
    try {
      result = await services.get();
      if (result is APISuccess) {
        List<dynamic> res = result.data['data'];
        for (var i = 0; i < res.length; i++) {
          Map<String, dynamic> mapClass = res[i];
          Class item = Class.fromJS(mapClass);
          classes.add(item);
          if (item.calendars.isNotEmpty){
            item.day = item.calendars[0].day;
          }

          if (mapSchoolarYear.containsKey(item.scholarYear)) {
            mapSchoolarYear.update(item.scholarYear, (values) {
              values.add(item);
              return values;
            });
          } else {
            mapSchoolarYear.putIfAbsent(item.scholarYear, () => [item]);
          }
        }

        classes.sort((a, b) => int.parse(a.semester) - int.parse(b.semester));
        print("hahaha,: " + mapSchoolarYear.keys.toString());
        yield state.update(classes: classes, mapScholarYear: mapSchoolarYear);
      } else if (result is APIError) {
        yield state.update(error: result);
      }

    } catch (e) {
      yield state.update(isLoading: false);
    }
  }
}
