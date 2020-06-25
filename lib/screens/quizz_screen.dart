import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../controllers/quizz_controller.dart';

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
      _buildTrue(),
      _buildFalse(),
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
          DialogButton(
            child: Text("Non"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          DialogButton(
            child: Text("Oui"),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _score.clear();
                _counter = 0;
                quizzController.shuffleQuestion();
              });
            },
          ),
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
            _buildScore(),
            _buildQuestion(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _randomButton),
          ],
        ),
      ),
    );
  }

  Widget _buildScore() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _score,
        ),
      ),
    );
  }

  Widget _close() {
    return Icon(
      Icons.close,
      size: 30.0,
      color: Colors.red,
    );
  }

  Widget _check() {
    return Icon(
      Icons.check,
      size: 30.0,
      color: Colors.green,
    );
  }

  Widget _buildQuestion() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Text(
          quizzController.getQuestionText(_counter),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTrue() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: FlatButton(
        textColor: Colors.white,
        color: Colors.green,
        child: Text(
          "Vrai",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: () {
          setState(() {
            if (quizzController.getAnswer(_counter) == true) {
              _score.add(_check());
            } else {
              _score.add(_close());
            }
          });
          _increment();
        },
      ),
    );
  }

  Widget _buildFalse() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: FlatButton(
        textColor: Colors.white,
        color: Colors.red,
        child: Text(
          "Faux",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: () {
          setState(() {
            if (quizzController.getAnswer(_counter) == false) {
              _score.add(_check());
            } else {
              _score.add(_close());
            }
          });
          _increment();
        },
      ),
    );
  }
}
