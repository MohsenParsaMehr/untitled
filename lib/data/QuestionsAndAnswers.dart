class QuestionAndAnswer{
  //int id = 0;
  String question;
  String answer;
  QuestionAndAnswer(
      this.question,
      this.answer
      );
  static List<QuestionAndAnswer> samples = [
    QuestionAndAnswer("sample question", "sample answer"),
    QuestionAndAnswer("test question 2", "test answer 2")
  ];
}
