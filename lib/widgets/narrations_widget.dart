import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/lecture_dto.dart';
import 'package:untitled/data/lectures_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/utilities/settings.dart';
import "package:untitled/data/api_lecture_search_criterias.dart";
import 'package:untitled/widgets/lectures_widget.dart';

class NarrationsWidget extends StatefulWidget {
  const NarrationsWidget(Key key) : super(key: key);
  @override
  State<NarrationsWidget> createState() => _NarrationsWidgetState();
}

class _NarrationsWidgetState extends State<NarrationsWidget> {
  int _currentLectureIndex = 0, _currentLectureParagraphIndex = 0;
  Future<List<LectureDto>> _lectures = Future.value([]);
//  var _lectures = LecturesRepository<APILectureSearchCriterias>().getLectures(
  //     Settings.getLecturesUrl,
  //    APILecturesQuery(topic: ''),
  //    APILectureSearchCriterias());
  List<LectureDto> _lecturesSnapshotData = [];

  _NarrationsWidgetState() {
    _lectures = LecturesRepository().getLectures(
        Settings.getLecturesUrl,
        LectureDto(),
        LectureSearchCriterias(
            type: LectureType.narration
                .toString()
                .replaceFirst(RegExp(r'LectureType.'), '')));
  }
  String? _selectedBookItem;
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
                    Icons.mic_external_on_rounded,
                    color: Colors.black26,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  // (_type == LectureType.book || _type == LectureType.poem
                  // ?
                  FutureBuilder<List<LectureDto>>(
                    future: _lectures,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!;
                        return DropdownButton<String>(
                          hint: Text(_selectedBookItem ??
                              AppLocalizations.of(context)!.selectNarration),
                          //isExpanded: true,
                          style:
                              PersianFonts.Yekan.copyWith(color: Colors.teal),
                          alignment: Alignment.topRight,
                          value: _selectedBookItem,
                          items: data
                              .map((e) => e.topic)
                              //  <String>[
                              //   'کتاب 4',
                              //   'کتاب 3',
                              //   'کتاب 2',
                              //   'کتاب 1'   ]
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) => setState(() {
                            _selectedBookItem = value ?? "";
                          }),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                  //  : Text(
                  //      AppLocalizations.of(context)!.lectures,
                  //      style: const TextStyle(
                  //          fontSize: 14, fontWeight: FontWeight.bold),
                  //   ))
                  ,
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        IconButton.outlined(
                            onPressed: () {
                              var snackBar = SnackBar(
                                content: Text(
                                    _lecturesSnapshotData[_currentLectureIndex]
                                        .mediaUrl
                                        .toString()),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            icon: const Icon(
                              Icons.download_rounded,
                              size: 18,
                              color: Colors.black45,
                            )),
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_rounded,
                              size: 18,
                              color: Colors.black45,
                            )),
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline_rounded,
                                size: 18, color: Colors.black45)),
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(Icons.shuffle_rounded,
                                size: 18, color: Colors.black45)),
                      ]))
                ],
              ),
              FutureBuilder<List<LectureDto>>(
                  future: _lectures, // LecturesRepository().getData(""),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<LectureDto>> snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        (snapshot.data != null && snapshot.data!.isEmpty)) {
                      if (snapshot.data != null && snapshot.data!.isEmpty) {
                        // load cashed QA data as internet connection is not available
                        return Text(AppLocalizations.of(context)!.listIsEmpty);
                      } else if (snapshot.data != null &&
                          snapshot.data!.isNotEmpty &&
                          snapshot.data![_currentLectureIndex]
                                  .lectureParagraphs !=
                              null &&
                          snapshot.data![_currentLectureIndex]
                              .lectureParagraphs!.isEmpty) {
                        return Text(AppLocalizations.of(context)!.listIsEmpty);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    } else {
                      _lecturesSnapshotData = snapshot.data!;

                      return Column(children: [
                        //Expanded(
                        //child:
                        ExpandableText(
                          textAlign: TextAlign.start,
                          style: PersianFonts.Samim.copyWith(fontSize: 13),
                          (snapshot.data!.isEmpty ||
                                  snapshot.data![_currentLectureIndex]
                                              .lectureParagraphs !=
                                          null &&
                                      snapshot.data![_currentLectureIndex]
                                          .lectureParagraphs!.isEmpty
                              ? AppLocalizations.of(context)!.listIsEmpty
                              : snapshot
                                      .data![_currentLectureIndex]
                                      .lectureParagraphs![
                                          _currentLectureParagraphIndex]
                                      .lectureParagraphBody ??
                                  AppLocalizations.of(context)!.listIsEmpty),
                          expandText: AppLocalizations.of(context)!.viewMore,
                          maxLines: 4,
                          linkColor: Colors.deepPurple,
                          animation: true,
                          collapseOnTextTap: true,
                          //prefixText:
                          // (_type == LectureType.lecture ? '' : ''),
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
                          //)
                        ),
                        Row(children: [
                          const Icon(
                            Icons.speaker_notes_rounded,
                            color: Colors.black26,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Expanded(
                              child: ExpandableText(
                            textAlign: TextAlign.justify,
                            style: PersianFonts.Samim.copyWith(fontSize: 13),
                            (snapshot.data!.isEmpty ||
                                    snapshot.data![_currentLectureIndex]
                                                .lectureParagraphs !=
                                            null &&
                                        snapshot.data![_currentLectureIndex]
                                            .lectureParagraphs!.isEmpty
                                ? ''
                                : snapshot
                                        .data![_currentLectureIndex]
                                        .lectureParagraphs![
                                            _currentLectureParagraphIndex]
                                        .lectureParagraphTitle ??
                                    'لیست خالی است'),
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
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return const Scaffold(
        //     body: Text('Lecture Details or List Page'),
        //   );
        // }));
      },
      onHorizontalDragEnd: (details) {
        if (!details.primaryVelocity!.isNegative) {
          const snackBar = SnackBar(
            content: Text('to right'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            if (_currentLectureParagraphIndex <
                _lecturesSnapshotData[_currentLectureIndex]
                        .lectureParagraphs!
                        .length -
                    1) {
              ++_currentLectureParagraphIndex;
            } else {
              _currentLectureParagraphIndex = 0;
            }
          });
        } else {
          const snackBar = SnackBar(
            content: Text('to left'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            if (_currentLectureParagraphIndex > 0) {
              --_currentLectureParagraphIndex;
            } else {
              _currentLectureParagraphIndex =
                  _lecturesSnapshotData[_currentLectureIndex]
                          .lectureParagraphs!
                          .length -
                      1;
            }
          });
        }
      },
    );
  }
}
