import 'package:flutter/material.dart';
import 'package:learnflutter/data/questions.dart';
import 'package:learnflutter/home_answer_btn.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    void moveToNext() {
      setState(() {
        counter > 4 ? counter = 0 : counter++;
      });
    }

    String question = questions[counter].question;
    String answer0 = questions[counter].answers[0];
    String answer1 = questions[counter].answers[1];
    String answer2 = questions[counter].answers[2];
    String answer3 = questions[counter].answers[3];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              question,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              AnswerButton(onPressed: moveToNext, answer: answer0),
              AnswerButton(onPressed: moveToNext, answer: answer1),
              AnswerButton(onPressed: moveToNext, answer: answer2),
              AnswerButton(onPressed: moveToNext, answer: answer3),
            ]),
          )
        ],
      ),
    );
  }
}
