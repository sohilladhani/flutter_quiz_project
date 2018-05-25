import 'package:flutter_quiz_project/utils/questions.dart';

class Quiz {
  /* Underscore ('_') to make variables private */
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  /* getter for score */
  int get score => _score;

  /* getter for question list */
  List<Question> get questions => _questions;

  /* getter for questions length or the total questions */
  int get totalQuestions => _questions.length;

  /* getter for the current question number */
  int get currentQuestionNumber => _currentQuestionIndex + 1;

  /* getter for the next question */
  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= totalQuestions) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isAnswerCorrect) {
    /* Update the score when the answer is correct*/
    if (isAnswerCorrect) _score++;
  }
}
