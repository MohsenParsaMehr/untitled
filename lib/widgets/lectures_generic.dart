import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/APILecturesQuery.dart';
import 'package:untitled/data/lecture_dto.dart';
import 'package:untitled/data/lectures_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/utilities/settings.dart';
import "package:untitled/data/api_lecture_search_criterias.dart";
import 'package:untitled/widgets/lectures_widget.dart';

class LecturesGenericWidget extends StatefulWidget {
  final LectureType type;
  final Color _color, _tintColor;
  const LecturesGenericWidget(Key key, this.type, this._color, this._tintColor)
      : super(key: key);
  @override
  State<LecturesGenericWidget> createState() =>
      _LecturesGenericWidgetState(type, _color, _tintColor);
}

class _LecturesGenericWidgetState extends State<LecturesGenericWidget> {
  int _currentLectureIndex = 0;
  Future<List<LectureDto>> _lectures = Future.value([]);
//  var _lectures = LecturesRepository<APILectureSearchCriterias>().getLectures(
  //     Settings.getLecturesUrl,
  //    APILecturesQuery(topic: ''),
  //    APILectureSearchCriterias());
  List<LectureDto> _lecturesSnapshotData = [];
  final Color _color, _tintColor;
  _LecturesGenericWidgetState(this._type, this._color, this._tintColor) {
    switch (_type) {
      case LectureType.narration:
      case LectureType.quran:
      case LectureType.book:
      case LectureType.poem:
        _lectures = LecturesRepository().getLectures(
            Settings.getLecturesUrl,
            LectureDto(),
            LectureSearchCriterias(
                type: _type
                    .toString()
                    .replaceFirst(RegExp(r'LectureType.'), '')));
      default:
        break;
    }
  }
  final LectureType _type;
  String? _selectedBookItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: _color,
          surfaceTintColor: _tintColor,
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
                    Icons.menu_book_rounded,
                    color: Colors.black26,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  (_type == LectureType.book || _type == LectureType.poem
                      ? DropdownButton<String>(
                          hint: const Text('کتاب 1'),
                          //isExpanded: true,
                          style:
                              PersianFonts.Yekan.copyWith(color: Colors.teal),
                          alignment: Alignment.topRight,
                          value: _selectedBookItem,
                          items: <String>[
                            'کتاب 4',
                            'کتاب 3',
                            'کتاب 2',
                            'کتاب 1'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) => setState(() {
                            _selectedBookItem = value ?? "";
                          }),
                        )
                      : Text(
                          AppLocalizations.of(context)!.lectures,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
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
                          snapshot.data![_currentLectureIndex].topic,
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
                            Icons.mic_rounded,
                            color: Colors.black26,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Expanded(
                              child: ExpandableText(
                            textAlign: TextAlign.justify,
                            style: PersianFonts.Samim.copyWith(fontSize: 13),
                            snapshot.data![_currentLectureIndex].lectureBody!,
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
            if (_currentLectureIndex < _lecturesSnapshotData.length - 1) {
              ++_currentLectureIndex;
            } else {
              _currentLectureIndex = 0;
            }
          });
        } else {
          const snackBar = SnackBar(
            content: Text('to left'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            if (_currentLectureIndex > 0) {
              --_currentLectureIndex;
            } else {
              _currentLectureIndex = _lecturesSnapshotData.length - 1;
            }
          });
        }
      },
    );
  }
}
