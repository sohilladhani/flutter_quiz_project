import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/utils/questions.dart';
import 'package:flutter_quiz_project/utils/quiz.dart';
import 'package:flutter_quiz_project/ui/answer_button.dart';
import 'package:flutter_quiz_project/ui/question_text.dart';
import 'package:flutter_quiz_project/ui/correct_wrong_overlay.dart';

import 'package:flutter_quiz_project/pages/score_page.dart';

/*  StatefulWidget can be rebuilt. Meaning the state of the widget can
*   can be changed. e.g. for animation, give feedback to the user
*   StatefulWidget is itself is immutable. One needs to use 'State' class
*   (which is mutable), which allows to rebuild visuals on the StatefulWidget
*/
class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;

  Quiz quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Pizza is healthy", false),
    new Question("Ginger tea is awesome", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.currentQuestionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // Main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayVisible == true
            ? new CorrectWrongOverlay(isCorrect, () {
          if (quiz.totalQuestions == questionNumber) {
            Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new ScorePage(quiz.score, quiz.totalQuestions)),
                    (Route route) => route == null);
            return;
          }
          currentQuestion = quiz.nextQuestion;
          this.setState(() {
            overlayVisible = false;
            questionText = currentQuestion.question;
            questionNumber = quiz.currentQuestionNumber;
          });
        })
            : new Container()
      ],
    );
  }
}
