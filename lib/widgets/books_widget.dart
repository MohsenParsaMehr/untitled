import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/dto/api_lecture_search_criterias.dart';
import 'package:untitled/data/dto/lecture_dto.dart';
import 'package:untitled/data/repositories/lectures_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/utilities/settings.dart';
import 'package:untitled/widgets/book_selection.dart';
import 'package:untitled/widgets/lectures_widget.dart';
import 'package:untitled/widgets/bottom_sheet_popup.dart';

class BooksWidget extends StatefulWidget {
  const BooksWidget(Key key) : super(key: key);

  @override
  State<BooksWidget> createState() => _BooksWidgetState();
  // @override
  //void initState() => focusNode = FocusNode();
}

class _BooksWidgetState extends State<BooksWidget> {
  int _currentLectureIndex = 0, _currentLectureParagraphIndex = 0;
  FocusNode focusNode = FocusNode();
  Future<List<LectureDto>> _lectures = Future.value([]);
//  var _lectures = LecturesRepository<APILectureSearchCriterias>().getLectures(
  //     Settings.getLecturesUrl,
  //    APILecturesQuery(topic: ''),
  //    APILectureSearchCriterias());
  List<LectureDto> _lecturesSnapshotData = [];

  _BooksWidgetState() {
    _lectures = LecturesRepository().getLectures(
        Settings.getLecturesUrl,
        LectureDto(),
        LectureSearchCriterias(
            locale: Settings.locale,
            type: LectureType.book
                .toString()
                .replaceFirst(RegExp(r'LectureType.'), '')));
  }
  String? _selectedBookItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: Colors.orange.withOpacity(0.8),
          surfaceTintColor: Colors.orange,
          elevation: 7,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    opacity: 0.1,
                    image: const AssetImage('assets/images/art-back.jpg'))),
            padding: const EdgeInsets.all(12),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.menu_book_sharp,
                    color: Colors.black26,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  Text(AppLocalizations.of(context)!.books,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lime,
                      )),
                  IconButton(
                      onPressed: () => BottomSheetPopUp.show(
                          context,
                          BookSelectionWidget(
                              const Key('book_selection'), LectureType.book)),
                      icon: const Icon(Icons.arrow_drop_down)),
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
                            onPressed: () {
                              //Share.share(AppLocalizations.of(context)!.share);
                            },
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
                                      .lectureParagraphTitle ??
                                  AppLocalizations.of(context)!.listIsEmpty),
                          expandText: AppLocalizations.of(context)!.viewMore,
                          maxLines: 5,
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
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ExpandableText(
                                  textAlign: TextAlign.justify,
                                  style:
                                      PersianFonts.Yekan.copyWith(fontSize: 13),
                                  (snapshot.data!.isEmpty ||
                                          snapshot.data![_currentLectureIndex]
                                                      .lectureParagraphs !=
                                                  null &&
                                              snapshot
                                                  .data![_currentLectureIndex]
                                                  .lectureParagraphs!
                                                  .isEmpty
                                      ? ''
                                      : snapshot
                                              .data![_currentLectureIndex]
                                              .lectureParagraphs![
                                                  _currentLectureParagraphIndex]
                                              .lectureParagraphBody ??
                                          'لیست خالی است'),
                                  expandText: 'نمایش بیشتر',
                                  maxLines: 5,
                                  linkColor: Colors.deepPurple,
                                  animation: true,
                                  collapseOnTextTap: true,
                                  //prefixText: 'Pref',
                                  onPrefixTap: () => {},
                                  prefixStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                          )
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
