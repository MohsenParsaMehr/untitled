import 'package:flutter/cupertino.dart';
import 'package:untitled/Slideshow.dart';

import '../widgets/qaWidget.dart';

Widget home(){
  return Padding(padding: const EdgeInsets.all(5),
    child: Column(children:[ const SlideShow(),   qaWidget()])  );
}