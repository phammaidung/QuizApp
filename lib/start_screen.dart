import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(149, 254, 239, 239),
          ),
          // Opacity(
          //   opacity: .5,
          //   child:
          //   Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 40),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
                fontSize: 22, color: const Color.fromARGB(255, 245, 218, 252)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                'Start Quiz',
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 249, 248, 251),
                  backgroundColor: const Color.fromARGB(255, 145, 75, 243),
                  padding: const EdgeInsets.all(8.0),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
              onPressed: startQuiz,
            ),
          )
        ],
      ),
    );
  }
}
