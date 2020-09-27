part of 'class_bloc.dart';

abstract class ClassEvent extends Equatable {
  const ClassEvent();
}

class LoadClassesByStudentId extends ClassEvent {
  final String userId;
  LoadClassesByStudentId({this.userId});
  @override
  List<Object> get props => [userId];
  @override
  String toString() {
    return "LoadClassesByStudentId: $userId";
  }
}