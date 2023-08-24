import 'package:flutter/material.dart';
import 'package:untitled/data/QuestionsAndAnswers.dart';
Widget qaWidget(){
  int currentQuestionIndex = 0;
  return Stack(children: <Widget>[ Card(
      elevation: 7,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(padding: const EdgeInsets.all(12), child:
      Column( mainAxisAlignment: MainAxisAlignment.start,
          children: [Row(mainAxisAlignment: MainAxisAlignment.start, children: [ const Text("Question And Answers",
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),

            Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.outlined(onPressed: (){/*TODO: Do share here*/},
                      icon: const Icon(Icons.share,size: 18,color: Colors.black45,)),
                  IconButton.outlined(onPressed: (){/*TODO: Do bookmark here*/},
                      icon: const Icon(Icons.bookmark,size: 18,color: Colors.black45)),
                  IconButton.outlined(onPressed: (){/*TODO: Do Maximize here*/},
                      icon: const Icon(Icons.square_outlined,size: 18,color: Colors.black45))
                ])],),
            Text(QuestionAndAnswer.samples[currentQuestionIndex].question, textAlign: TextAlign.start,),
            Row(children: [ const Text('"',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Text(QuestionAndAnswer.samples[currentQuestionIndex].answer),
              const Text('"',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)],)

          ]
      ),
      )
  ),const Align(alignment: AlignmentDirectional.centerEnd, child: FlutterLogo(),) ],) ;

}