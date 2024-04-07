import 'package:flutter/material.dart';
import 'package:qquiz/question_summry/summry_item.dart';

class QuestionSummry extends StatelessWidget {
  const QuestionSummry(this.summrydata, {super.key});

  final List<Map<String, Object>> summrydata;
  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summrydata.map((data) {
            return SummryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
