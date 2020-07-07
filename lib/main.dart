import 'package:flutter/material.dart';

import 'screens/quizz_screen.dart';

void main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TheQuizz",
      home: QuizzScreen(),
    );
  }
}
