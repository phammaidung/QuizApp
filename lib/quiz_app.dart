import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  //Widget? activeScreen;
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';
  void changeScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      //activeScreen = const QuestionsScreen();
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        //selectedAnswer = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  // @override
  // void initState() {
  //   activeScreen = StartScreen(changeScreen);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(changeScreen);
    if (activeScreen == 'questions-screen') {
      setState(() {
        screenWidget = QuestionsScreen(
          onSelectedAnswer: chooseAnswer,
        );
      });
    }
    if (activeScreen == 'results-screen') {
      setState(() {
        screenWidget = ResultsScreen(
          restartQuiz: restartQuiz,
          chosenAnswer: selectedAnswer,
        );
      });
    }

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.deepPurple[400],
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 138, 73, 250),
                Color.fromARGB(255, 225, 101, 237)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: screenWidget)),
    );
  }
}
