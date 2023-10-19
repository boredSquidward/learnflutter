import 'package:flutter/material.dart';
import 'package:learnflutter/data/questions.dart';
import 'package:learnflutter/home_quiz.dart';
import 'package:learnflutter/home_result.dart';
import 'package:learnflutter/home_start.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String activeScreen = 'start-screen';
  List<String> chosenAnswers = [];

  void switchToQuizScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void switchToResultScreen() {
    setState(() {
      activeScreen = 'result-screen';
    });
  }

  void addAnswerToList(String answer) {
    chosenAnswers.add(answer);

    if (chosenAnswers.length == questions.length) {
      switchToResultScreen();
    }
  }

  void goBackHome() {
    chosenAnswers = [];

    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 242, 242, 242),
          body: Center(
            child: activeScreen == 'start-screen'
                ? HomeStart(switchToQuizScreen)
                : activeScreen == 'quiz-screen'
                    ? Quiz(
                        onSelectAnswer: addAnswerToList,
                      )
                    : Result(onTap: goBackHome, answers: chosenAnswers),
          )),
    );
  }
}
