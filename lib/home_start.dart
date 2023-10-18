import 'package:flutter/material.dart';

var url = 'assets/images/cool-question-mark-sticker.webp';

class HomeStart extends StatelessWidget {
  const HomeStart(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          url,
          width: 250,
          height: 250,
        ),
        TextButton(
          onPressed: switchScreen,
          child: const Text(
            'start quiz!',
            style:
                TextStyle(color: Color.fromARGB(255, 97, 4, 143), fontSize: 22),
          ),
        )
      ],
    );
  }
}
