import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qquiz/data/question.dart';

import 'package:qquiz/question_summry/question_summry.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummryData() {
    final List<Map<String, Object>> summry = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summry.add(
        {
          'question-index': i,
          'question': question[i].text,
          'correct-answer': question[i].answer[0],
          'user-answer': chosenAnswer[i],
        },
      );
    }
    return summry;
  }

  @override
  Widget build(context) {
    final summrydata = getSummryData();
    final numTotleQuestion = question.length;
    final numcorrectQuestion = summrydata.where((data) {
      return data['correct-answer'] == data['user-answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numcorrectQuestion out of $numTotleQuestion question correctly!',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(159, 212, 211, 211),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            QuestionSummry(summrydata),
            const SizedBox(height: 20),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              onPressed: onRestart,
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
