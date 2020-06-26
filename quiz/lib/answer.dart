import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onSelect;
  Answer(this.text, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              this.text,
              style: TextStyle(fontSize: 18),
            ),
            onPressed: onSelect));
  }
}
