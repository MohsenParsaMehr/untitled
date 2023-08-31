import 'package:flutter/material.dart';
import 'package:untitled/data/lectures.dart';
Widget lecturesWidget(){
  int currentQuestionIndex = 0;
  return  Card(
    color: Colors.green,
surfaceTintColor: Colors.lightGreen,
      elevation: 7,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(padding: const EdgeInsets.all(12), child:
      Column( mainAxisAlignment: MainAxisAlignment.start,
          children: [Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Text("Lectures", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
            Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.outlined(onPressed: (){/*TODO: Do download here*/},
                      icon: const Icon(Icons.download_rounded,size: 18,color: Colors.black45,)),
                  IconButton.outlined(onPressed: (){/*TODO: Do share here*/},
                      icon: const Icon(Icons.share_rounded,size: 18,color: Colors.black45,)),
                  IconButton.outlined(onPressed: (){/*TODO: Do bookmark here*/},
                      icon: const Icon(Icons.bookmark_add_rounded,size: 18,color: Colors.black45)),
                  IconButton.outlined(onPressed: (){/*TODO: Do Maximize here*/},
                      icon: const Icon(Icons.crop_square_rounded,size: 18,color: Colors.black45))
                ])],),
            Text(lecture.samples[currentQuestionIndex].topic, textAlign: TextAlign.start,),
            Row(children: [ const Text('"',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Text(lecture.samples[currentQuestionIndex].body),
              const Text('"',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)],),
            Text(lecture.samples[currentQuestionIndex].forDate.toString())
          ]
      ),
      )
  );
}