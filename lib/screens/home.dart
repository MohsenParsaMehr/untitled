import 'package:flutter/material.dart';
import 'package:pwa_install/pwa_install.dart';
import 'package:untitled/widgets/books_widget.dart';
import 'package:untitled/widgets/concepts.dart';
import 'package:untitled/widgets/narrations_widget.dart';
import 'package:untitled/widgets/poems_widget.dart';
import 'package:untitled/widgets/slideshowWidget.dart';
import 'package:untitled/widgets/eulogy_compact_widget.dart';
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

  String? error;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _pullRefresh,
        child: Padding(
            padding: const EdgeInsets.all(1),
            child: ListView(
                scrollDirection: Axis.vertical,
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
                  if (PWAInstall().installPromptEnabled)
                    ElevatedButton(
                        onPressed: () {
                          try {
                            PWAInstall().promptInstall_();
                          } catch (e) {
                            setState(() {
                              error = e.toString();
                            });
                          }
                        },
                        child: const Text('Install')),
                  if (error != null) Text(error!),
                  //Column(children: <Widget>[
                  const SlideShowWidget(),
                  const QaWidget(Key('3')),
                  const NarrationsWidget(Key('4')),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConceptsWidget(),
                      ConceptsWidget(),
                    ],
                  ),

                  const BooksWidget(Key('5')),
                  const PoemsWidget(Key('6')),
                  //const Text('Eulogy'),
                  const EulogyCompactWidget(),
                  const Row(children: <Widget>[
                    photosWidget(),
                    //Expanded(child: videosWidget())
                    // ],
                    //)
                  ])
                ])));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //if (state == AppLifecycleState.paused) {

    //}
  }
}
