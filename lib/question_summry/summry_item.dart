import 'package:flutter/material.dart';
import 'package:qquiz/question_summry/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummryItem extends StatelessWidget {
  const SummryItem(
    this.itemData, {
    super.key,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemData['user-answer'] == itemData['correct-answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question-index'] as int),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 223, 222, 222),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              //const SizedBox(height: 7),
              Text(
                itemData['correct-answer'] as String,
                style: TextStyle(
                  color: Colors.pink[300],
                ),
              ),
              Text(
                itemData['user-answer'] as String,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 7),
            ],
          ),
        ),
      ],
    );
  }
}
