import 'package:flutter/material.dart';
import 'package:untitled/data/QuestionsAndAnswers.dart';
import 'package:untitled/network/green_light_service.dart';
import 'package:untitled/network/qa_model.dart';

class qaWidget extends StatefulWidget {
  const qaWidget(Key key) : super(key: key);
  @override
  State<qaWidget> createState() => _qaWidgetState();
}

class _qaWidgetState extends State<qaWidget> {

  int _currentQuestionIndex = 0;
  List<APIQAQuery> _qaSnapshotData =[];
  late Future<List<APIQAQuery>> qaApiData;
  @override void initState(){
    qaApiData =  GreenLightService().getDataDio();
  }
  @override
  Widget build(BuildContext context) {


    return  GestureDetector(
      child: Card(
          color: Colors.teal,
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
                FutureBuilder<List<APIQAQuery>>(future: qaApiData, builder: (BuildContext context, AsyncSnapshot<List<APIQAQuery>> snapshot){
                  if(!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator(),);
                  }
                  else{
                    _qaSnapshotData = snapshot.data!;
                    return Row(children:[
                    Text(snapshot.data![_currentQuestionIndex].question, textAlign: TextAlign.start,),
                    Row(children: [ const Text('"',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    Text(snapshot.data![_currentQuestionIndex].answer),
                    const Text('"',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)])
                  ] );
                  }
                })
              ]
          ),
          )
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){ return Container(child: Text('QA Details or List Page'),);}));
      },

      onHorizontalDragEnd: (details){
         if(!details.primaryVelocity!.isNegative){
            const snackBar = SnackBar(
              content: Text('to right'),
            );
           ScaffoldMessenger.of(context).showSnackBar(snackBar);
           setState(() {
             if(_qaSnapshotData != null) {
               if (_currentQuestionIndex < _qaSnapshotData.length-1) {
                 ++_currentQuestionIndex;
               }
               else{
                 _currentQuestionIndex=0;
               }
             }
           });
         }
         else{
            const snackBar = SnackBar(
              content: Text('to left'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            setState(() {
              if(_qaSnapshotData != null) {
                if (_currentQuestionIndex > 0) {
                  --_currentQuestionIndex;
                }
                else{
                  _currentQuestionIndex = _qaSnapshotData.length-1;
                }
              }
            });
         }
      },
    );
  }
}

