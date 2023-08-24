import 'package:untitled/data/media.dart';
import 'package:untitled/data/tag.dart';

class lecture{
  //int id = 0;
  String topic;
  String body;
  DateTime forDate;
  List<tag>? tags;
  List<media>? medias;
  lecture(
      this.topic,
      this.body,
      this.forDate,
      this.tags,
      this.medias

      );
  static List<lecture> samples = [
    lecture("Sample topic","Test Body of lecture",DateTime.now(),[tag("Creation"),tag( "Universe")],[]),
    lecture("second topic","Test Body of second topic",DateTime.now(),[tag("example"),tag( "test")],[]),
  ];
}