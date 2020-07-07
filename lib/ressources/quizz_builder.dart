import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzBuilder {
  static Widget close() {
    return Icon(
      Icons.close,
      size: 30.0,
      color: Colors.red,
    );
  }

  static Widget check() {
    return Icon(
      Icons.check,
      size: 30.0,
      color: Colors.green,
    );
  }

  static Widget buildQuestion(String questionText) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Text(
          questionText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  static Widget buildScore({List<Widget> point}) {
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
          children: point,
        ),
      ),
    );
  }

  static Widget buildButton(
      {@required String name,
      @required void onTap(),
      @required MaterialColor color}) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: FlatButton(
        textColor: Colors.white,
        color: color,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }

  static Widget buttonDial({String name, void onTap()}) {
    return DialogButton(
      child: Text(name),
      onPressed: onTap,
    );
  }
}
