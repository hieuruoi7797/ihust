import 'package:ihust/models/Question.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/models/Teacher.dart';
import 'package:ihust/utils/services.dart';

class QuestionState {
  Question question;
  final bool isLoading;
  final APIError error;
  QuestionState({this.question, this.error, this.isLoading});
  factory QuestionState.init(){
    return QuestionState(
      question: null,
      isLoading: false,
      error: null
    );
  }
  factory QuestionState.GetQuestion({Question question}){
    return QuestionState(question: question);
  }
  QuestionState update({Question question, APIError error, bool isLoading}) {
    if (question == null) {
      print("this infor" + this.question.toString());
    } else {
      this.question = question;
      print("this333 infor" + this.question.options.toString());
    }
    return copyWith(
        this,
        question: question,
        error: error,
        isLoading: isLoading);
  }


  QuestionState copyWith(QuestionState oldState,
  {Question question, APIError error, bool isLoading}) {
    if(question != null){
      print(question.question+ "vl");
    }
    return QuestionState(
      question: question ?? oldState.question,
      error: error,
      isLoading: isLoading ?? oldState.isLoading);
  }
}