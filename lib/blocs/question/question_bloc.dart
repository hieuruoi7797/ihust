import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ihust/blocs/question/question_event.dart';
import 'package:ihust/blocs/question/question_state.dart';
import 'package:ihust/models/Question.dart';
import 'package:ihust/utils/services.dart';
import 'package:ihust/utils/utils.dart';


class QuestionBloc extends Bloc<QuestionEvent,QuestionState> {
  @override
  QuestionState get initialState => QuestionState.init();

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    if (event is LoadQuestion)
      yield* _loadQuestion(event.data);
  }


  Stream<QuestionState> _loadQuestion(String data) async* {
    yield state.update(isLoading: true, error: null);
    APIResult apiResult;
    String sessionId = await ClientUtils.getDeviceDetails();
    AppServices services = new AppServices(
        action: "getquestion&sessionid=$sessionId&data=$data",
        body: null);
    try {
      apiResult = await services.get();

      if (apiResult is APISuccess) {
        print("hieu ${apiResult.data['data']}");
       dynamic mapQuestion = jsonDecode(apiResult.data['data']);

        print("yyyy $mapQuestion");
        Question question = Question.fromJson(mapQuestion);

        print("yyyyOO ${ question.question}");
        yield state.update(question: question);
        await Future.delayed(Duration(milliseconds: 0));
      } else if (apiResult is APIError) {
        yield state.update(error: apiResult);
      }
    } catch (e) {
      yield state.update(isLoading: false);
    }
  }
}