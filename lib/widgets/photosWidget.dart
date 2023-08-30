import 'package:flutter/material.dart';

class photosWidget extends StatefulWidget {
  const photosWidget({Key? key}) : super(key: key);

  @override
  photosWidgetState createState() => photosWidgetState();
}

class photosWidgetState extends State<photosWidget> {
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

  @override
  Widget build(BuildContext context) {
    return
      /*Card(
        elevation: 20,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child:*/
        ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Column(children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/sample.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                const Text('Photo Album'), ]
              ),
              const Text('Next')
            ]
        );
  }
}
