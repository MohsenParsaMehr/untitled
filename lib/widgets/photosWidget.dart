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
    return GestureDetector(
        onTap: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Show Albums'))),
        onHorizontalDragEnd: (DragEndDetails dragDetails) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Next Photo')));

        },
        child: Card(
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(children: <Widget>[
              /*Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Eulogies", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    IconButton.outlined(onPressed: (){*/ /*TODO: Do download here*/ /*},
                        icon: const Icon(Icons.download,size: 18,color: Colors.black45,)),
                    IconButton.outlined(onPressed: (){*/ /*TODO: Do share here*/ /*},
                        icon: const Icon(Icons.share,size: 18,color: Colors.black45,)),
                    IconButton.outlined(onPressed: (){*/ /*TODO: Do bookmark here*/ /*},
                        icon: const Icon(Icons.bookmark,size: 18,color: Colors.black45)),
                    IconButton.outlined(onPressed: (){*/ /*TODO: Do Maximize here*/ /*},
                        icon: const Icon(Icons.square_outlined,size: 18,color: Colors.black45))
                  */
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
                const Text('Photo Album'),
              ])
            ])));
  }
}
