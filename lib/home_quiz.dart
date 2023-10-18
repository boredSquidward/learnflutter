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
              ...questions[counter].answers.map((answer) =>
                  AnswerButton(onPressed: moveToNext, answer: answer))
            ]),
          )
        ],
      ),
    );
  }
}
