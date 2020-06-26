import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(PerguntaApp());
final List<Map<String, Object>> _questions = [
  {
    'text': 'What is your favorite color?',
    'answers': [
      {'text': 'Black', 'score': 10},
      {'text': 'Red', 'score': 5},
      {'text': 'Green', 'score': 4},
      {'text': 'Blue', 'score': 2},
    ]
  },
  {
    'text': 'What is your favorite animal?',
    'answers': [
      {'text': 'Cat', 'score': 8},
      {'text': 'Dog', 'score': 1},
      {'text': 'Cow', 'score': 7},
      {'text': 'Lion', 'score': 6},
    ]
  },
  {
    'text': 'What is your favorite teacher?',
    'answers': [
      {'text': 'Maria', 'score': 2},
      {'text': 'Leonard', 'score': 4},
      {'text': 'Peter', 'score': 1},
      {'text': 'Philip', 'score': 9}
    ]
  }
];

class QuizAppState extends State<PerguntaApp> {
  var _selectedAnswer = 0;
  var _total = 0;
  void _answer(int score) {
    if (hasQuestion) {
      setState(() {
        _selectedAnswer++;
        _total += score;
      });
    }
  }

  void _restart() {
    setState(() {
      _selectedAnswer = 0;
      _total = 0;
    });
  }

  bool get hasQuestion {
    return _selectedAnswer < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Questions'),
            centerTitle: true,
          ),
          body: hasQuestion
              ? Quiz(
                  selected: _selectedAnswer,
                  questions: _questions,
                  answer: _answer)
              : Result(_total, _restart)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return QuizAppState();
  }
}
