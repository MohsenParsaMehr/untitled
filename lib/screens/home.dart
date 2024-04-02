import 'package:flutter/material.dart';
import 'package:untitled/widgets/slideshowWidget.dart';
import 'package:untitled/widgets/eulogy_compact_widget.dart';
import 'package:untitled/widgets/lectures_widget.dart';
import 'package:untitled/widgets/videosWidget.dart';
import '../widgets/qa_widget.dart';
import 'package:untitled/widgets/photosWidget.dart';

class Home extends StatefulWidget {
  const Home(Key key) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _pullRefresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _pullRefresh,
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListView(
                scrollDirection: Axis.vertical,
                primary: true,
                shrinkWrap: true,
                children: const <Widget>[
                  //Column(children: <Widget>[
                  SlideShowWidget(),
                  QaWidget(Key('3')),
                  LecturesWidget(Key('4'), LectureType.book),
                  //const Text('Eulogy'),
                  EulogyCompactWidget(),
                  Row(children: <Widget>[
                    photosWidget(),
                    //Expanded(child: videosWidget())
                    // ],
                    //)
                  ])
                ])));
  }
}
