import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  int _score;
  int _numberOfQuestions;
  Function _resetQuiz;

  Score(this._score, this._resetQuiz, this._numberOfQuestions);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[
        Text(
          'Results: Your score is ${_score / _numberOfQuestions * 100} %',
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
          child: Text('Restart', style: TextStyle(fontSize: 20, color: Colors.blue)),
          onPressed: () => _resetQuiz(),
        )
      ]),
    );
  }
}
