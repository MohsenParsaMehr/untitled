import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/QuestionsAndAnswers.dart';
Widget questionAndAnswers(){
  return ListView.builder(itemCount: QuestionAndAnswer.samples.length,
      itemBuilder: (BuildContext context, int index)
  {
      return Padding(padding: const EdgeInsets.all(10), child: Card(elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child:Column(children: <Widget>[
           Text(QuestionAndAnswer.samples[index].question),
           const SizedBox(height: 20),
           Text(QuestionAndAnswer.samples[index].answer)])));
  });
}