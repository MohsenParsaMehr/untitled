import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class videosWidget extends StatefulWidget {
  const videosWidget({Key? key}) : super(key: key);

  @override
  videosWidgetState createState() => videosWidgetState();
}

class videosWidgetState extends State<videosWidget> {
  late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player,);
  @override
  void initState() {
    super.initState();
    player.open(Media('https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'));
    player.pause();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: //SizedBox(
        //MediaQuery.of(context).size.width,
        // MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        Video(controller: controller,width: 300,height: 200),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //if (state == AppLifecycleState.paused) {

    //}
  }

}
