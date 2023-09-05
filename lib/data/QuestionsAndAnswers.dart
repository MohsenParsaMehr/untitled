class QuestionAndAnswer{
  int id = 0;
  String question;
  String answer;
  QuestionAndAnswer({
    required this.id,
    required this.question,
    required this.answer
  });
   static List<QuestionAndAnswer> samples= [
      QuestionAndAnswer(id:0, question: "sample question", answer: "sample answer"),
      QuestionAndAnswer(id:1, question: "sample question1", answer: "sample answer2")
    ];


  Map<String, dynamic> toMap() => {
    "id": id,
    "question": question,
    "answer": answer,
  };
  factory QuestionAndAnswer.fromMap(Map<String, dynamic> json) => QuestionAndAnswer(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
  );
}
