import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/slideshowWidget.dart';
import 'package:untitled/widgets/eulogyCompactWidget.dart';
import 'package:untitled/widgets/lecturesWidget.dart';
import 'package:untitled/widgets/videosWidget.dart';
import '../widgets/qaWidget.dart';
import 'package:untitled/widgets/photosWidget.dart';

class home extends StatelessWidget {
  const home(Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
            scrollDirection: Axis.vertical,
            primary: true,
            shrinkWrap: true,
            children: <Widget>[
              //Column(children: <Widget>[
                const slideShowWidget(),
                qaWidget(Key('3')),
                lecturesWidget(),
                //const Text('Eulogy'),
                const eulogyCompactWidget(),
                const Row(
                  children: <Widget>[
                    photosWidget(),
                    Expanded(child: videosWidget())
                 // ],
                //)
              ])
            ]));
  }
}
