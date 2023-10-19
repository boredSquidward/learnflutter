import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.onTap, required this.answers});
  final void Function() onTap;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...answers.map(
        (answer) => Text(answer, textAlign: TextAlign.start),
      ),
      ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.purple[900]),
        ),
        child: const Text('Go Home'),
      )
    ]);
  }
}
