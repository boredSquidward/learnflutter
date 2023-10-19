import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnflutter/data/questions.dart';
import 'package:learnflutter/result_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.onTap, required this.answers});
  final void Function() onTap;
  final List<String> answers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'id': i,
        'question': questions[i].question,
        'user-answer': answers[i],
        'correct-answer': questions[i].answers[0]
      });
    }

    return summary;
  }

  int getCorrectAnswers() {
    int correctAnswers = 0;

    for (var i = 0; i < answers.length; i++) {
      answers[i] == questions[i].answers[0] ? correctAnswers++ : null;
    }

    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> info = getSummary();

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          'You answered ${getCorrectAnswers()} out of ${answers.length} questions correctly!',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...info.map(
                (item) => ResultSummary(item),
              ),
            ],
          ),
        ),
      ),
      TextButton(
        onPressed: onTap,
        child: Text(
          'Go Home',
          style: TextStyle(
            fontSize: 16,
            color: Colors.purple[900],
          ),
        ),
      )
    ]);
  }
}
