import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'package:flutter_quiz_project/pages/quiz_page.dart';
import 'package:flutter_quiz_project/pages/score_page.dart';

/* entry point for the application */
void main() {
  runApp(new MaterialApp(
    /* home page for the application */
    home: new LandingPage(),
  ));
}
