import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/network/green_light_service.dart';
import 'package:untitled/network/qa_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/utilities/constants.dart';

class QaWidget extends StatefulWidget {
  const QaWidget(Key key) : super(key: key);
  @override
  State<QaWidget> createState() => _QaWidgetState();
}

class _QaWidgetState extends State<QaWidget> {
  int _currentQuestionIndex = 0;
  List<APIQAQuery> _qaSnapshotData = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: Colors.teal.withOpacity(0.8),
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
                    Icons.question_answer_rounded,
                    color: Colors.black26,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  Text(AppLocalizations.of(context)!.questionAndAnswers,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              size: 18,
                              color: Colors.black45,
                            )),
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline_rounded,
                                size: 18, color: Colors.black45)),
                      ]))
                ],
              ),
              FutureBuilder<List<APIQAQuery>>(
                  future:
                      GreenLightService().getQAs(Constants.baseUrl, null, null),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<APIQAQuery>> snapshot) {
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
                      _qaSnapshotData = snapshot.data!;
                      return Column(children: [
                        Row(children: [
                          const Icon(
                            Icons.question_mark_rounded,
                            color: Colors.black26,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Text(
                            snapshot.data![_currentQuestionIndex].question,
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                        Row(children: [
                          const Icon(Icons.mark_chat_read_rounded,
                              color: Colors.black26),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Expanded(
                              child: ExpandableText(
                            textAlign: TextAlign.justify,
                            style: PersianFonts.Samim.copyWith(fontSize: 13),
                            snapshot.data![_currentQuestionIndex].answer,
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
                          ))
                        ])
                        //])
                      ]);
                    }
                  })
            ]),
          )),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Text('QA Details or List Page'),
          );
        }));
      },
      onHorizontalDragEnd: (details) {
        if (!details.primaryVelocity!.isNegative) {
          // const snackBar = SnackBar(
          //   content: Text('to right'),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            if (_currentQuestionIndex < _qaSnapshotData.length - 1) {
              ++_currentQuestionIndex;
            } else {
              _currentQuestionIndex = 0;
            }
          });
        } else {
          // const snackBar = SnackBar(
          //   content: Text('to left'),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            if (_currentQuestionIndex > 0) {
              --_currentQuestionIndex;
            } else {
              _currentQuestionIndex = _qaSnapshotData.length - 1;
            }
          });
        }
      },
    );
  }
}
