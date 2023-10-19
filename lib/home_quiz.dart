import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnflutter/data/questions.dart';
import 'package:learnflutter/home_answer_btn.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
    required this.onQuizCompletion,
    required this.onSelectAnswer,
  });

  final void Function() onQuizCompletion;
  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  var currentQuestionIndex = 0;

  void goToResultScreen() {
    widget.onQuizCompletion();
  }

  @override
  Widget build(BuildContext context) {
    void moveToNext(String answer) {
      widget.onSelectAnswer(answer);

      setState(() {
        currentQuestionIndex < 4 ? currentQuestionIndex++ : goToResultScreen();
      });
    }

    String question = questions[currentQuestionIndex].question;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  question,
                  style: GoogleFonts.roboto(fontSize: 24),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                ...questions[currentQuestionIndex]
                    .getShuffledAnswers()
                    .map((answer) => AnswerButton(
                        onPressed: () {
                          moveToNext(answer);
                        },
                        answer: answer))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
