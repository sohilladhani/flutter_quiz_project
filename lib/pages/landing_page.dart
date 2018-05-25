import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/pages/quiz_page.dart';

/* Stateless Widgets are static widgets that are not rendered periodically*/

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Think of Material as a piece of paper */
    return new Material(
      color: Colors.indigoAccent,
      /* Inkwell is like a big invisible button */
      child: new InkWell(
        onTap: () =>
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          /* Main Axis is the Y-axis*/
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Let's play quiz", style: new TextStyle(
                color: Colors.white, fontSize: 50.0,
                fontWeight: FontWeight.bold)),
            new Text("Tap to start!", style: new TextStyle(
                color: Colors.white, fontSize: 20.0,
                fontStyle: FontStyle.italic
            ),)
          ],
        ),
      ),);
  }
}
