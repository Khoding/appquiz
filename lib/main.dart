import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Qu\'elle est l\'extension d\'un fichier dart?',
      'answers': [
        {'text': '.java', 'score': 0},
        {'text': '.cs', 'score': 0},
        {'text': '.dart', 'score': 1},
        {'text': '.kt', 'score': 0}
      ],
    },
    {
      'questionText': 'Quel est le composant générique de flutter?',
      'answers': [
        {'text': 'class', 'score': 0},
        {'text': 'object', 'score': 0},
        {'text': 'widget', 'score': 1},
        {'text': 'map', 'score': 0}
      ],
    },
    {
      'questionText': 'La librairie de base à importer est',
      'answers': [
        {'text': 'question', 'score': 0},
        {'text': 'android', 'score': 0},
        {'text': 'answer', 'score': 1},
        {'text': 'material', 'score': 0}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('Il y encore une question!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
