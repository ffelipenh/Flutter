import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int selected;
  final List<Map<String, Object>> questions;
  final void Function(int score) answer;

  Quiz({
    @required this.selected,
    @required this.questions,
    @required this.answer,
  });

  bool get hasQuestion {
    return selected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestion ? questions[selected]['answers'] : null;

    return Column(children: <Widget>[
      Question(questions[selected]['text']),
      ...answers.map((p) => Answer(p['text'], () => answer(p['score'])))
    ]);
  }
}
