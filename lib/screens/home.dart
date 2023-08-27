import 'package:flutter/cupertino.dart';
import 'package:untitled/Slideshow.dart';
import 'package:untitled/widgets/lecturesWidget.dart';
import 'package:untitled/widgets/eulogyWidget.dart';
import '../widgets/qaWidget.dart';

Widget home(){
  return Padding(padding: const EdgeInsets.all(5),
    child: Column(children:
    [ const SlideShow(),

      qaWidget(),
    lecturesWidget(),
      const Text('Eulogy'),
      const eulogyWidget()
    ])  );
}