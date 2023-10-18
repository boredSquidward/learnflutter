import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Text('Learn Flutter the fun way!',
            style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.purple[900],
                fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: switchScreen,
          child: Text(
            'start quiz!',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 97, 4, 143), fontSize: 26),
          ),
        )
      ],
    );
  }
}
