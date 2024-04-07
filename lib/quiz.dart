import 'package:flutter/material.dart';
import 'package:qquiz/question_screen.dart';
import 'package:qquiz/result_screen.dart';
import 'package:qquiz/start_screen.dart';
import 'package:qquiz/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(swichScreen);
    super.initState();
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = StartScreen(swichScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == question.length) {
      setState(() {
        activeScreen = ResultScreen(
          chosenAnswer: selectedAnswer,
          onRestart: restartQuiz,
        );
      });
    }
  }

  void swichScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
