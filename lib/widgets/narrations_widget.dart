import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/dto/api_lecture_search_criterias.dart';
import 'package:untitled/data/dto/lecture_dto.dart';
import 'package:untitled/data/repositories/lectures_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/utilities/settings.dart';
import 'package:untitled/widgets/book_options_widget.dart';
import 'package:untitled/widgets/book_selection.dart';
import 'package:untitled/widgets/bottom_sheet_popup.dart';
import 'package:untitled/widgets/lectures_widget.dart';
import 'package:untitled/widgets/search_options_widget.dart';

class NarrationsWidget extends StatefulWidget {
  const NarrationsWidget(Key key) : super(key: key);
  @override
  State<NarrationsWidget> createState() => _NarrationsWidgetState();
}

class _NarrationsWidgetState extends State<NarrationsWidget> {
  int _currentLectureIndex = 0, _currentLectureParagraphIndex = 0;
  IconData _narrationPlayIcon = Icons.play_arrow_rounded;
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
  void handleMenuClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: Colors.green.withOpacity(0.8),
          surfaceTintColor: Colors.lightGreen,
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
            padding: const EdgeInsets.all(8),
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
                  Text(AppLocalizations.of(context)!.lectures,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lime,
                      )),
                  IconButton(
                      onPressed: () => BottomSheetPopUp.show(
                          context,
                          BookSelectionWidget(const Key('narration_selection'),
                              LectureType.narration)),
                      icon: const Icon(Icons.arrow_drop_down)),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                        PopupMenuButton<int>(
                          color: Colors.black,
                          // onOpened: () => {
                          //   BottomSheetPopUp.show(
                          //       context,
                          //       SearchOptionsWidget(
                          //           const Key('bookSearchOptions')))
                          // },
                          onSelected: (item) => handleMenuClick(item),
                          itemBuilder: (context) => [
                            PopupMenuItem<int>(
                                value: 0,
                                child: IconButton.outlined(
                                    onPressed: () {
                                      var snackBar = SnackBar(
                                        content: Text(_lecturesSnapshotData[
                                                _currentLectureIndex]
                                            .mediaUrl
                                            .toString()),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    icon: const Icon(
                                      Icons.download_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ))),
                            PopupMenuItem<int>(
                                value: 1,
                                child: IconButton.outlined(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shuffle_rounded,
                                        size: 18, color: Colors.white))),
                          ],
                        ),
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
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                          AppLocalizations.of(context)!
                                              .listIsEmpty),
                                  expandText:
                                      AppLocalizations.of(context)!.viewMore,
                                  maxLines: 4,
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
                                ),
                              )),
                              ClipOval(
                                child: Material(
                                  color: Colors.orangeAccent, // Button color
                                  child: InkWell(
                                    splashColor:
                                        Colors.orangeAccent, // Splash color
                                    onTap: () {
                                      setState(() {
                                        _narrationPlayIcon =
                                            (_narrationPlayIcon ==
                                                    Icons.play_arrow_rounded
                                                ? Icons.pause_rounded
                                                : Icons.play_arrow_rounded);
                                      });
                                    },
                                    child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Icon(_narrationPlayIcon)),
                                  ),
                                ),
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
