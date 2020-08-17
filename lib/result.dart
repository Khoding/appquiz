import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  String get resultPhrase {
    String resultText;
    if (resultScore <= 1) {
      resultText = 'Le résultat final n\'est pas très bon!';
    } else if (resultScore <= 2) {
      resultText = 'Résultat moyen!';
    } else {
      resultText = 'Ok, vous pouvez continuer!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              child: Text('Recommencer!'),
              textColor: Colors.blue,
              onPressed: resetQuiz),
        ],
      ),
    );
  }

  Result(this.resultScore, this.resetQuiz);
}
