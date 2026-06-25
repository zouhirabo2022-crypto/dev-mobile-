import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Map<String, Object> _answer;
  Function _handleAnswer;

  Answer(this._answer, this._handleAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(10),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            _answer['answer'] as String,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
        onPressed: () => _handleAnswer(_answer),
      ),
    );
  }
}
