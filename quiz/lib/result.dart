import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int total;
  final void Function() restart;

  Result(this.total, this.restart);

  String get sentense {
    if (total < 8) {
      return 'Congrats..!';
    } else if (total < 12) {
      return 'You are the best!';
    } else if (total < 16) {
      return 'Amazing!';
    } else {
      return 'Level Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: Text(sentense, style: TextStyle(fontSize: 28))),
        FlatButton(
            textColor: Colors.blue,
            child: Text('Restart?', style: TextStyle(fontSize: 18)),
            onPressed: restart)
      ],
    );
  }
}
