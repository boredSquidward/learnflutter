import 'package:flutter/material.dart';
import 'package:learnflutter/home_quiz.dart';
import 'package:learnflutter/home_start.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
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
              ? HomeStart(switchScreen)
              : const Quiz(),
        ),
      ),
    );
  }
}
