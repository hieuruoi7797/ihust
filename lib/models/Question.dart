import '../config.dart';

class Question{
  int questionId = Config.NULL_ID;
  String question = Config.NULL_TXT;
  String imageUrl = Config.NULL_TXT;
  String videoUrl = Config.NULL_TXT;
  String answer = Config.NULL_TXT;
  List<dynamic> options = new List<String>();
  Question.fromJson(dynamic mapQuestion) {
    print(mapQuestion['options'].runtimeType);
    this.question = mapQuestion['question'];
    this.imageUrl = mapQuestion['imageUrl'];
    this.videoUrl = mapQuestion['videoUrl'];
    this.answer = mapQuestion['answer'];
    this.options = mapQuestion['options'];
//    this.cpa = mapStudent['cpa'];
    // this.cvUrl = mapStudent['cvUrl'];
    print("xxx");
  }
}
