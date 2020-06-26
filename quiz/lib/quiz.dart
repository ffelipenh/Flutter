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

  bool get temPergunta {
    return selected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPergunta ? questions[selected]['answers'] : null;

    return Column(children: <Widget>[
      Question(questions[selected]['text']),
      ...respostas.map((p) => Resposta(p['text'], () => answer(p['score'])))
    ]);
  }
}
