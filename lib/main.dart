// Packages
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(BaePickerApp());

class BaePickerApp extends StatefulWidget {
  @override
  _BaePickerAppState createState() => _BaePickerAppState();
}

class _BaePickerAppState extends State<BaePickerApp> {
  final _questions = const [
    {
      'text': 'Do you have a girl friend?',
      'answers': ['Yes', 'No', 'Kinda']
    },
    {
      'text': 'How do you treat your woman?',
      'answers': [
        'I make her needy',
        'I give her all my attention',
        'I buy her all the stuff she needs'
      ]
    },
    {
      'text': 'Do you like dogs?',
      'answers': ['Yes', 'No', 'Kinda']
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      this._questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bae Picker'),
        ),
        body: (this._questionIndex < this._questions.length)
            ? Column(
                children: [
                  Question(
                    questionText: this._questions[this._questionIndex]['text'],
                  ),
                  ...(this._questions[this._questionIndex]['answers']
                          as List<String>)
                      .map((answer) => Answer(
                            answerText: answer,
                            selectHandler: this._answerQuestion,
                          ))
                      .toList()
                ],
              )
            : Center(
                child: Text('Perfect! You are my love'),
              ),
      ),
    );
  }
}
