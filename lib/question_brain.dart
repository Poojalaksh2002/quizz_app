import 'question.dart';

class QuestionBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question("You can lead a cow down stairs but not up stairs.", false),
    Question("Approximately one quarter of human bones are in the feet.", true),
    Question('A slug\'s blood is green.', true),
  ];

  String getQuest() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAns() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestNum() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isQuizCompleted() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');

      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
