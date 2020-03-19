part of 'authorize_bloc.dart';

abstract class AuthorizeEvent extends Equatable {
  const AuthorizeEvent();
}

class LoginWithUserNameAndPasswordEvent extends AuthorizeEvent {
  final String userName;
  final String password;
  LoginWithUserNameAndPasswordEvent({this.userName, this.password});
  @override
  List<Object> get props => [userName, password];
  @override
  String toString() {
    return "LoginWithUserNameAndPasswordEvent: $userName / $password";
  }
}

class AppStarted extends AuthorizeEvent {
  AppStarted();
  @override
  List<Object> get props => null;
}
