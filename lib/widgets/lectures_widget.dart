import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/APILecturesQuery.dart';
import 'package:untitled/data/lectures_repository';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LecturesWidget extends StatefulWidget {
  const LecturesWidget(Key key) : super(key: key);
  @override
  State<LecturesWidget> createState() => _LecturesWidgetState();
}

class _LecturesWidgetState extends State<LecturesWidget> {
  int currentLectureIndex = 0;
  List<APILecturesQuery> _lecturesSnapshotData = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: Colors.green.withOpacity(0.8),
          surfaceTintColor: Colors.lightGreen,
          elevation: 7,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.mic_external_on,
                    color: Colors.black26,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    AppLocalizations.of(context)!.lectures,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                            icon: const Icon(Icons.favorite_outline_rounded,
                                size: 18, color: Colors.black45)),
                      ]))
                ],
              ),
              FutureBuilder<List<APILecturesQuery>>(
                  future: LecturesRepository().getData(""),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<APILecturesQuery>> snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        (snapshot.data != null && snapshot.data!.isEmpty)) {
                      if (snapshot.data != null && snapshot.data!.isEmpty) {
                        // load cashed QA data as internet connection is not available
                        return Text(AppLocalizations.of(context)!.listIsEmpty);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    } else {
                      _lecturesSnapshotData = snapshot.data!;

                      return Column(children: [
                        Text(
                          snapshot.data![currentLectureIndex].topic,
                          textAlign: TextAlign.start,
                        ),
                        Row(children: [
                          const Icon(
                            Icons.mic_rounded,
                            color: Colors.black26,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Expanded(
                              child: ExpandableText(
                            textAlign: TextAlign.justify,
                            style: PersianFonts.Samim.copyWith(fontSize: 13),
                            snapshot.data![currentLectureIndex].body,
                            expandText: 'نمایش بیشتر',
                            maxLines: 4,
                            linkColor: Colors.deepPurple,
                            animation: true,
                            collapseOnTextTap: true,
                            //prefixText: 'Pref',
                            onPrefixTap: () => {},
                            prefixStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            onHashtagTap: (name) => {},
                            hashtagStyle: const TextStyle(
                              color: Color(0xFF30B6F9),
                            ),
                            onMentionTap: (username) => {},
                            mentionStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            onUrlTap: (url) => {},
                            urlStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          )),
                        ])
                      ]);
                    }
                  })
            ]),
          )),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Text('Lecture Details or List Page'),
          );
        }));
      },
      onHorizontalDragEnd: (details) {
        if (!details.primaryVelocity!.isNegative) {
          const snackBar = SnackBar(
            content: Text('to right'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            if (currentLectureIndex < _lecturesSnapshotData.length - 1) {
              ++currentLectureIndex;
            } else {
              currentLectureIndex = 0;
            }
          });
        } else {
          const snackBar = SnackBar(
            content: Text('to left'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            if (currentLectureIndex > 0) {
              --currentLectureIndex;
            } else {
              currentLectureIndex = _lecturesSnapshotData.length - 1;
            }
          });
        }
      },
    );
  }
}
