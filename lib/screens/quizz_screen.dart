import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../controllers/quizz_controller.dart';
import '../ressources/quizz_builder.dart';

QuizzController quizzController = QuizzController();

class QuizzScreen extends StatefulWidget {
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  List<Widget> _score = [];
  List<Widget> _randomButton = [];
  int _counter = 0;
  var alertStyle = AlertStyle(
    isOverlayTapDismiss: false,
    titleStyle: TextStyle(
      color: Colors.red,
    ),
  );

  @override
  void initState() {
    super.initState();
    _randomButton = [
      QuizzBuilder.buildButton(
        name: "Vrai",
        onTap: () {
          setState(() {
            if (quizzController.getAnswer(_counter) == true) {
              _score.add(QuizzBuilder.check());
            } else {
              _score.add(QuizzBuilder.close());
            }
          });
          _increment();
        },
        color: Colors.green,
      ),
      QuizzBuilder.buildButton(
        name: "Faux",
        onTap: () {
          setState(() {
            if (quizzController.getAnswer(_counter) == false) {
              _score.add(QuizzBuilder.check());
            } else {
              _score.add(QuizzBuilder.close());
            }
          });
          _increment();
        },
        color: Colors.red,
      ),
    ];
  }

  void resetQuizz() {
    Alert(
        context: context,
        style: alertStyle,
        type: AlertType.info,
        title: "Fin du quizz",
        desc: "Le quizz est erminé, voulez-vous le relancer ?",
        buttons: <DialogButton>[
          QuizzBuilder.buttonDial(
              name: 'Non',
              onTap: () {
                Navigator.pop(context);
              }),
          QuizzBuilder.buttonDial(
              name: 'Oui',
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _counter = 0;
                  _score.clear();
                  quizzController.shuffleQuestion();
                });
              }),
        ]).show();
  }

  void _increment() {
    if (_counter >= 9) {
      resetQuizz();
    } else {
      setState(() {
        _counter++;
        _randomButton.shuffle();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            QuizzBuilder.buildScore(point: _score),
            QuizzBuilder.buildQuestion(
                quizzController.getQuestionText(_counter)),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _randomButton),
          ],
        ),
      ),
    );
  }
}
