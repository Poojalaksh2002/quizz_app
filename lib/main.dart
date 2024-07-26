import 'package:flutter/material.dart';
import 'dart:math';
import 'question.dart';
import 'question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBrain questionBrain = QuestionBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];

  // List<bool> answers = [false, true, true];

  List<Widget> scoreKeeper = [];

  void checkAns(bool userInput) {
    bool res = questionBrain.getAns();

    setState(() {
      if (questionBrain.isQuizCompleted() == true) {
        Alert(
                context: context,
                title: "Quiz Completion Alert",
                desc: 'You\'v reached the quiz end')
            .show();
        scoreKeeper = [];
        questionBrain.reset();
      } else {
        if (res == userInput) {
          print('wow correct one!!');
          scoreKeeper.add(Icon(Icons.check));
        } else {
          print('Nah wrong..');
          scoreKeeper.add(Icon(Icons.close));
        }

        questionBrain.nextQuestNum();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(questionBrain.getQuest()),
        ),
        Column(
          children: [
            Container(
              child: FilledButton(
                  child: Text("True"),
                  onPressed: () {
                    checkAns(true);
                  }),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: FilledButton(
                  child: Text("False"),
                  onPressed: () {
                    checkAns(false);
                  }),
            ),
          ],
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
