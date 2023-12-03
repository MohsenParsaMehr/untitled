import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class videosWidget extends StatefulWidget {
  const videosWidget({Key? key}) : super(key: key);

  @override
  videosWidgetState createState() => videosWidgetState();
}

class videosWidgetState extends State<videosWidget> {
  late Player player = Player();
  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(
    player,
  );
  @override
  void initState() {
    super.initState();
    try {
      player.open(Media(
          'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'));
    } on Exception catch (e) {
      print(e);
    }
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
        child: Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              AppLocalizations.of(context)!.videos,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            IconButton.outlined(
                onPressed: () {/*TODO: Do download here*/},
                icon: const Icon(
                  Icons.download_rounded,
                  size: 18,
                  color: Colors.black45,
                )),
            IconButton.outlined(
                onPressed: () {/*TODO: Do share here*/},
                icon: const Icon(
                  Icons.share_rounded,
                  size: 18,
                  color: Colors.black45,
                )),
            IconButton.outlined(
                onPressed: () {/*TODO: Do bookmark here*/},
                icon: const Icon(Icons.bookmark_add_rounded,
                    size: 18, color: Colors.black45)),
            IconButton.outlined(
                onPressed: () {/*TODO: Do Maximize here*/},
                icon: const Icon(Icons.crop_square_rounded,
                    size: 18, color: Colors.black45))
          ]),
          //SizedBox(
          //MediaQuery.of(context).size.width,
          // MediaQuery.of(context).size.width * 9.0 / 16.0,
          // Use [Video] widget to display video output.

          Video(controller: controller, width: 300, height: 200),
        ]));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //if (state == AppLifecycleState.paused) {

    //}
  }
}
