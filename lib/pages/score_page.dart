import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/pages/landing_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQustion;

  ScorePage(this.score, this.totalQustion);

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.blueAccent,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Your score: ",
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0),
            ),
            new Text(score.toString() + "/" + totalQustion.toString(),
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0)),
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () =>
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (
                                BuildContext contetxt) => new LandingPage()),
                            (Route route) => route == null),
                color: Colors.white,
                iconSize: 50.0)
          ],
        ));
  }
}
