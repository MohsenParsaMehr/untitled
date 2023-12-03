import 'package:flutter/material.dart';
import 'package:untitled/data/APILecturesQuery.dart';
import 'package:untitled/data/lectures.dart';
import 'package:untitled/data/lectures_repository';

class lecturesWidget extends StatefulWidget {
  const lecturesWidget(Key key) : super(key: key);
  @override
  State<lecturesWidget> createState() => _lecturesWidgetState();
}

class _lecturesWidgetState extends State<lecturesWidget> {
  int currentLectureIndex = 0;
  List<APILecturesQuery> _lecturesSnapshotData = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: Colors.green,
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
                  const Text(
                    "Lectures",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                  ])
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
                        return const Text('List is empty');
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    } else {
                      _lecturesSnapshotData = snapshot.data!;
                      return Row(children: [
                        Text(
                          snapshot.data![currentLectureIndex].question,
                          textAlign: TextAlign.start,
                        ),
                        Row(children: [
                          const Text(
                            '"',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(snapshot.data![currentLectureIndex].answer),
                          const Text(
                            '"',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ])
                      ]);
                    }
                  })
              /* Text(
                  lecture.samples[currentLectureIndex].topic,
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    const Text(
                      '"',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(lecture.samples[currentLectureIndex].body),
                    const Text(
                      '"',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(lecture.samples[currentLectureIndex].forDate.toString())*/
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
