class Question {
  final String question;
  final bool answer;

  /* Normal constructor like in Java*/
  /*Question(String question, bool answer) {
    this.question = question;
    this.answer = answer;
  }*/

  /* In dart, this is possible */
  Question(this.question, this.answer);
}
