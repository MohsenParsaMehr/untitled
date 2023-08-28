import 'package:flutter/material.dart';
// Make sure to add following packages to pubspec.yaml:
// * media_kit
// * media_kit_video
// * media_kit_libs_video
import 'package:media_kit/media_kit.dart';                      // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart';
class eulogyWidget extends StatefulWidget {
  const eulogyWidget({Key? key}) : super(key: key);
  @override
  State<eulogyWidget> createState() => MyScreenState();
}
class MyScreenState extends State<eulogyWidget> {
  // Create a [Player] to control playback.
  late final player = Player(configuration: const PlayerConfiguration(title: 'Hello world'));

  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    // Play a [Media] or [Playlist].
    //player.setVideoTrack(VideoTrack.no());
    player.open(Media('https://dl.rozmusic.com/Music/1402/06/03/Roozbeh%20Bemani%20-%20Bad%20Az%20Raftan.mp3',extras:
    {
      'artist':'Dr.',
      'Year':'2015',
    }),play: false);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200, //MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        child: Video(controller: controller,),
      ),
    );
  }
}