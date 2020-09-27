import 'package:equatable/equatable.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}

class LoadQuestion extends QuestionEvent {
  final String data;
  LoadQuestion({this.data});
  @override
  List<Object> get props => [data];
  @override
  String toString(){
    return "LoadQuestion: $data";
  }
}
