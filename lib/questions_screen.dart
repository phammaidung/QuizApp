import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var curIndex = 0;

  answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      curIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[curIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...currentQuestion.getShuffledAnswers().map(
              (answerText) {
                return AnswerButton(
                    text: answerText,
                    onTap: () {
                      answerQuestion(answerText);
                    });
              },
            )

            // ListView.builder(
            //     itemCount: 4,
            //     itemBuilder: ((context, index) {
            //       return Container(
            //           color: Colors.deepPurple[200], child: const Text('abc'));
            //     }))
          ],
        ),
      ),
    );
  }
}
