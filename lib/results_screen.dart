import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {required this.chosenAnswer, required this.restartQuiz, super.key});
  final List<String> chosenAnswer;
  final void Function() restartQuiz;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var index = 0; index < chosenAnswer.length; index++) {
      summary.add({
        'question_index': index,
        'question': questions[index].question,
        'correct_answer': questions[index].answers[0],
        'user_answer': chosenAnswer[index]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((element) {
      return element['user_answer'] == element['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 245, 218, 252)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            QuestionsSummary(summaryData),
            const SizedBox(height: 40),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(
                Icons.replay_sharp,
                color: Colors.white,
                size: 25,
              ),
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
            )
            // TextButton(
            //   onPressed: restartQuiz,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Icon(
            //         Icons.replay_sharp,
            //         color: Colors.white,
            //         size: 25,
            //       ),
            //       Text(
            //         'Restart Quiz!',
            //         style: GoogleFonts.lato(
            //             fontWeight: FontWeight.w600,
            //             fontSize: 16,
            //             color: Colors.white),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
