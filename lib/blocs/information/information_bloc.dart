import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/utils/services.dart';
import 'package:ihust/utils/utils.dart';

import 'information_event.dart';
import 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent,InformationState> {
  @override
  InformationState get initialState => InformationState.init();

  @override
  Stream<InformationState> mapEventToState(InformationEvent event) async* {
    if (event is LoadInforBySessionId)
      yield* _loadInforBySessionId();
  }


  Stream<InformationState> _loadInforBySessionId() async* {
    yield state.update(isLoading: true, error: null);
    APIResult apiResult;
    String sessionId = await ClientUtils.getDeviceDetails();
    AppServices services = new AppServices(
        action: "checklogin&sessionid=$sessionId",
        body: null);
    try {
      apiResult = await services.get();
      if (apiResult is APISuccess) {
        Map<String, dynamic> mapUserInfor = apiResult.data['data'];

        Student student = Student.fromJson(mapUserInfor);
        print(student.fullName);
        yield state.update(user: student);
        await Future.delayed(Duration(milliseconds: 0));
      } else if (apiResult is APIError) {
        yield state.update(error: apiResult);
      }
    } catch (e) {
      yield state.update(isLoading: false);
    }
  }
}