part of 'authorize_bloc.dart';

class AuthorizeState {
  final dynamic user;
  final APIError error;
  final bool isLoading;
  AuthorizeState({this.user, this.error, this.isLoading});
  factory AuthorizeState.init() {
    return AuthorizeState(
      user: null,
      isLoading: false,
      error: null
    );
  }
  factory AuthorizeState.loggedWithStudent({Student user}) {
    return AuthorizeState(user: user);
  }
  factory AuthorizeState.loggedWithTeacher({Teacher user}) {
    return AuthorizeState(user: user);
  }
  AuthorizeState update({Student user, APIError error, bool isLoading}) {
    if (user == null) {
      print("this" + this.user.toString());
    } else {
            print("this333" + this.user.toString());

    }
    return copyWith(
        this,
        user: user ,
        error: error,
        isLoading: isLoading);
  }

  AuthorizeState copyWith(AuthorizeState oldState,
      {Student user, APIError error, bool isLoading}) {
        if(user != null) {
          print(user.fullName + " vl");
        }
    return  AuthorizeState(
        user: user ?? oldState.user,
        error: error,
        isLoading: isLoading ?? oldState.isLoading);
  }
}
