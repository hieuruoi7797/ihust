import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

import 'package:bloc/bloc.dart';
import 'package:device_info/device_info.dart';
import 'package:equatable/equatable.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/models/Teacher.dart';
import 'package:ihust/utils/services.dart';
import 'package:ihust/utils/utils.dart';

part 'authorize_event.dart';
part 'authorize_state.dart';

class AuthorizeBloc extends Bloc<AuthorizeEvent, AuthorizeState> {
  @override
  AuthorizeState get initialState => AuthorizeState.init();

  @override
  Stream<AuthorizeState> mapEventToState(
    AuthorizeEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _appStarted();
    } else if (event is LoginWithUserNameAndPasswordEvent) {
      yield* _loginWithUserNameAndPassword(
          userName: event.userName, password: event.password);
    }
  }

  Stream<AuthorizeState> _loginWithUserNameAndPassword(
      {String userName, String password}) async* {
    yield state.update(isLoading: true, error: null);
    APIResult result;
    String sessionId = await getDeviceDetails();
    String encrpytedPass = ClientUtils().cryptoPasss(userName, password);
    print("suerPass: " + encrpytedPass);
    AppServices services = new AppServices(
        action:
            "login&username=$userName&password=$encrpytedPass&sessionid=$sessionId",
        body: null);
    try {
      result = await services.get();
      if (result is APISuccess) {
        Map<String, dynamic> mapUserInfo = result.data['data'];
        // check student or teacher
        Student student = Student.fromJson(mapUserInfo);
        print(student);
        print(student.fullName);
        yield state.update(user: student);
        await Future.delayed(Duration(milliseconds: 0));
      } else if (result is APIError) {
        yield state.update(error: result);
      }
    } catch (e) {}
    yield state.update(isLoading: false);
    // yield state.update(error: null);
  }

  Stream<AuthorizeState> _appStarted() async* {
    String imei = await getDeviceDetails();
    // print("sessionId: " + imei);
    AppServices services =
        new AppServices(action: "checklogin&sessiontid=$imei", body: null);
    APIResult result;
    try {
      result = await services.get();
      if (result is APISuccess) {
      } else if (result is APIError) {
        yield state.update(error: result);
      }
    } catch (e) {}

    // await Future.delayed(Duration(seconds: 3));
    // Student fake = new Student(name: "Kien dep trai", studentNum: 20081450);
    // yield AuthorizeState.loggedWithStudent(user: fake);
  }

  static Future<String> getDeviceDetails() async {
    // String deviceName;
    // String deviceVersion;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        // deviceName = build.model;
        // deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        // deviceName = data.name;
        // deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    return identifier;
  }
}
