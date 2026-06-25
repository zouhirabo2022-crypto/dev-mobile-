import 'package:flutter/material.dart';
import 'question.dart';
import 'score.dart';
import 'answer.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int score = 0;
  final quiz = [
    {
      'question': 'Q 1 - Which of the following is correct about Java 8 lambda expression ?',
      'answers': [
        {
          'answer':
              'A - Using lambda expression, you can refer to final variable or effectively final variable (which is assigned only once)',
          'correct': false
        },
        {
          'answer':
              'B - Lambda expression throws a compilation error, if a variable is assigned a value the second time ?',
          'correct': false
        },
        {'answer': 'C - Both of the above.', 'correct': true},
        {'answer': 'D - None of the above.', 'correct': false},
      ],
    },
    {
      'question':
          'Q 8 - Which of the following is the correct lambda expression which add two numbers and return their sum?',
      'answers': [
        {'answer': 'A - (int a, int b) -> { return a + b;};', 'correct': false},
        {'answer': 'B - (a, b) -> {return a + b;};', 'correct': false},
        {'answer': 'C - Both of the above.', 'correct': true},
        {'answer': 'D - None of the above.', 'correct': false},
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return (currentQuestionIndex >= quiz.length)
        ? Score(score, resetQuiz, quiz.length)
        : SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Question(quiz[currentQuestionIndex]['question'] as String,
                    currentQuestionIndex, quiz.length),
                ...(quiz[currentQuestionIndex]['answers'] as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(answer, handleAnswer);
                }),
              ],
            ));
  }

  void handleAnswer(answser) {
    print('Answer of question $currentQuestionIndex');
    setState(() {
      ++currentQuestionIndex;
    });
    if (answser['correct'] == true) ++score;
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }
}
