import 'package:ihust/models/Student.dart';
import 'package:ihust/models/Teacher.dart';
import 'package:ihust/utils/services.dart';

class InformationState {
  final dynamic user;
  final bool isLoading;
  final APIError error;
  InformationState({this.user, this.error, this.isLoading});
  factory InformationState.init(){
    return InformationState(
      user: null,
      isLoading: false,
      error: null
    );
  }
  factory InformationState.GetStudentInformation({Student user}){
    return InformationState(user: user);
  }
  factory InformationState.GetTeacherInformation({Teacher user}){
    return InformationState(user: user);
  }
  InformationState update({Student user, APIError error, bool isLoading}) {
    if (user == null) {
      print("this infor" + this.user.toString());
    } else {
      print("this333 infor" + this.user.toString());
    }
    return copyWith(
        this,
        user: user,
        error: error,
        isLoading: isLoading);
  }


  InformationState copyWith(InformationState oldState,
  {Student user, APIError error, bool isLoading}) {
    if(user != null){
      print(user.fullName+ "vl");
    }
    return InformationState(
      user: user ?? oldState.user,
      error: error,
      isLoading: isLoading ?? oldState.isLoading);
  }
}