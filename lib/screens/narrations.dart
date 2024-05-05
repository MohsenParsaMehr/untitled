import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/dto/api_lecture_search_criterias.dart';
import 'package:untitled/data/dto/lecture_dto.dart';
import 'package:untitled/data/repositories/lectures_repository.dart';
import 'package:untitled/screens/search.dart';
import 'package:untitled/settings/settings_view.dart';
import 'package:untitled/utilities/settings.dart';
import 'package:untitled/widgets/book_selection.dart';
import 'package:untitled/widgets/bottom_sheet_popup.dart';
import 'package:untitled/widgets/lectures_widget.dart';

class Narrations extends StatefulWidget {
  const Narrations(Key key) : super(key: key);
  static const routeName = '/Narrations';
  @override
  State<Narrations> createState() => _NarrationsState();
}

class _NarrationsState extends State<Narrations> {
  Future<void> _pullRefresh() async {
    setState(() {});
  }

  int _currentLectureIndex = 0, _currentLectureParagraphIndex = 0;
  FocusNode focusNode = FocusNode();
  Future<List<LectureDto>> _lectures = Future.value([]);
//  var _lectures = LecturesRepository<APILectureSearchCriterias>().getLectures(
  //     Settings.getLecturesUrl,
  //    APILecturesQuery(topic: ''),
  //    APILectureSearchCriterias());
  List<LectureDto> _lecturesSnapshotData = [];
  _NarrationsState() {
    _lectures = LecturesRepository().getLectures(
        Settings.getLecturesUrl,
        LectureDto(),
        LectureSearchCriterias(
            locale: Settings.locale,
            type: LectureType.narration
                .toString()
                .replaceFirst(RegExp(r'LectureType.'), '')));
  }
  String? _selectedBookItem;
  bool isShuffleEnabled = false, isBookmarked = false;
  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(children: [
            Text(
              AppLocalizations.of(context)!.lectures,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
                onPressed: () => BottomSheetPopUp.show(
                    context,
                    BookSelectionWidget(const Key('narration_selection'),
                        LectureType.narration)),
                icon: const Icon(Icons.arrow_drop_down))
          ]),
          actions: [
            IconButton(
              iconSize: 18,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.restorablePushNamed(context, Search.routeName);
              },
            ),
            IconButton(
              iconSize: 18,
              icon: const Icon(Icons.download),
              onPressed: () {
                //Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
            IconButton(
              iconSize: 18,
              icon: const Icon(Icons.share),
              onPressed: () {
                //Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
            IconButton(
                iconSize: 18,
                padding: const EdgeInsets.only(left: 4, right: 4, top: 0),
                icon: isShuffleEnabled == true
                    ? const Icon(Icons.shuffle_on)
                    : const Icon(Icons.shuffle),
                onPressed: () {
                  setState(() {
                    isShuffleEnabled = !isShuffleEnabled;
                  });
                }),
            IconButton(
                iconSize: 18,
                padding: const EdgeInsets.only(left: 4, right: 4, top: 0),
                icon: isBookmarked == true
                    ? const Icon(CupertinoIcons.bookmark_fill)
                    : const Icon(CupertinoIcons.bookmark),
                onPressed: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                }),
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 0,
                    child: Text(AppLocalizations.of(context)!.author)),
                PopupMenuItem<int>(
                    value: 1,
                    child: Text(AppLocalizations.of(context)!.author)),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: GestureDetector(
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
                padding: const EdgeInsets.all(12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FutureBuilder<List<LectureDto>>(
                          future:
                              _lectures, // LecturesRepository().getData(""),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<LectureDto>> snapshot) {
                            if (!snapshot.hasData ||
                                snapshot.data == null ||
                                (snapshot.data != null &&
                                    snapshot.data!.isEmpty)) {
                              if (snapshot.data != null &&
                                  snapshot.data!.isEmpty) {
                                // load cashed QA data as internet connection is not available
                                return Text(
                                    AppLocalizations.of(context)!.listIsEmpty);
                              } else if (snapshot.data != null &&
                                  snapshot.data!.isNotEmpty &&
                                  snapshot.data![_currentLectureIndex]
                                          .lectureParagraphs !=
                                      null &&
                                  snapshot.data![_currentLectureIndex]
                                      .lectureParagraphs!.isEmpty) {
                                return Text(
                                    AppLocalizations.of(context)!.listIsEmpty);
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
                                  style:
                                      PersianFonts.Samim.copyWith(fontSize: 13),
                                  (snapshot.data!.isEmpty ||
                                          snapshot.data![_currentLectureIndex]
                                                      .lectureParagraphs !=
                                                  null &&
                                              snapshot
                                                  .data![_currentLectureIndex]
                                                  .lectureParagraphs!
                                                  .isEmpty
                                      ? AppLocalizations.of(context)!
                                          .listIsEmpty
                                      : snapshot
                                              .data![_currentLectureIndex]
                                              .lectureParagraphs![
                                                  _currentLectureParagraphIndex]
                                              .lectureParagraphTitle ??
                                          AppLocalizations.of(context)!
                                              .listIsEmpty),
                                  expandText:
                                      AppLocalizations.of(context)!.viewMore,
                                  expanded: true,
                                  linkColor: Colors.deepPurple,
                                  animation: true,
                                  collapseOnTextTap: true,
                                  //prefixText:
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
                                  //)
                                ),
                                Row(children: [
                                  const Icon(
                                    Icons.speaker_notes_rounded,
                                    color: Colors.black26,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 5)),
                                  Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: ExpandableText(
                                          textAlign: TextAlign.justify,
                                          style: PersianFonts.Yekan.copyWith(
                                              fontSize: 13),
                                          (snapshot.data!.isEmpty ||
                                                  snapshot
                                                              .data![
                                                                  _currentLectureIndex]
                                                              .lectureParagraphs !=
                                                          null &&
                                                      snapshot
                                                          .data![
                                                              _currentLectureIndex]
                                                          .lectureParagraphs!
                                                          .isEmpty
                                              ? ''
                                              : snapshot
                                                      .data![
                                                          _currentLectureIndex]
                                                      .lectureParagraphs![
                                                          _currentLectureParagraphIndex]
                                                      .lectureParagraphBody ??
                                                  AppLocalizations.of(context)!
                                                      .listIsEmpty),
                                          expandText:
                                              AppLocalizations.of(context)!
                                                  .viewMore,
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
                                            decoration:
                                                TextDecoration.underline,
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
        )));
  }

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
}
