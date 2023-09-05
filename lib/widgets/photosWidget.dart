import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class photosWidget extends StatefulWidget {
  const photosWidget({Key? key}) : super(key: key);

  @override
  photosWidgetState createState() => photosWidgetState();
}
bool _isPlaying = false;

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


  List<Widget> getSliderItems(){
    return [];
  }
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];
  @override
  Widget build(BuildContext context) {
    return
      //ListView(
        //children: <Widget>[
      Container(
        //elevation: 20,
        //height: 400,
        //width: 400,
        //shape:        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child:
        CarouselSlider.builder(
            key: GlobalKey(),
            unlimitedMode: true,
            slideBuilder: (index) {
              return Container(
                alignment: Alignment.center,
                color: colors[index],
                child:
                  //const Image(image: AssetImage('images/')
                Text(
                  letters[index],
                  style: const TextStyle(fontSize: 200, color: Colors.white),
                ),
              );
            },
            slideTransform: const CubeTransform(),
            slideIndicator: CircularSlideIndicator(
              padding:   const EdgeInsets.only(bottom: 32),
            ),
            itemCount: getSliderItems().length),
      );



  }
}
