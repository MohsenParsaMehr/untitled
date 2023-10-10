import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/screens/questionAndAnswers.dart';
import 'package:untitled/data/database.dart';

import '../network/qa_model.dart';
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
  Future loadQAs() async {
    final jsonString = await rootBundle.loadString('assets/recipes1.json');
      return APIQAQuery.fromJson(jsonDecode(jsonString));
  }
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
  Future<void> insertQA(QuestionAndAnswer qa) async {
    // Get a reference to the database.
    final db = await database.getDatabase();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'QuestionAndAnswers',
      toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
