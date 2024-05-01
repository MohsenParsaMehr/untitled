import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/dto/api_lecture_search_criterias.dart';
import 'package:untitled/data/dto/lecture_dto.dart';
import 'package:untitled/data/repositories/lectures_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/utilities/settings.dart';
import 'package:untitled/widgets/lectures_widget.dart';

class BookSelectionWidget extends StatelessWidget {
  final LectureType type;
  BookSelectionWidget(Key key, this.type) : super(key: key);
  List<LectureDto> thumbs = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LectureDto>>(
      future: LecturesRepository().getLectures(
          Settings.getLecturesUrl,
          LectureDto(),
          LectureSearchCriterias(
              locale: Settings.locale,
              type: type // LectureType.book
                  .toString()
                  .replaceFirst(RegExp(r'LectureType.'), ''))),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          thumbs = snapshot.data!;
          return ListView.separated(
            itemCount: thumbs.length,
            separatorBuilder: (context, index) => (const Divider(
              thickness: 1,
              color: Colors.black38,
              height: 5,
            )),
            itemBuilder: (context2, index) => (ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(
                  width: 128,
                  height: 128,
                  errorBuilder: (context, exception, stackTrace) {
                    return const Icon(Icons.error);
                  },
                  "assets/images/${thumbs[index].captionImageUrl}",
                ),
                // CachedNetworkImage(
                //   alignment: Alignment.topCenter,
                //   imageUrl:
                //       "${Settings.protocol}://${Settings.baseUrl}/Images/Covers/${thumbs[index].captionImageUrl!}",
                //   errorWidget: (context, url, error) =>
                //       const Icon(Icons.error, size: 40),
                //   imageBuilder: (context, imageProvider) {
                //     return Ink.image(
                //         image: imageProvider,
                //         //fit: BoxFit.contain,
                //         width: 128,
                //         height: 128);
                //   },
                //   placeholder: (context, url) =>
                //       const CircularProgressIndicator(),
                // ),
                Expanded(
                    child: Column(children: [
                  Text(
                    thumbs[index].topic,
                  ),
                  Row(children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          style: const TextStyle(fontSize: 11),
                          '${AppLocalizations.of(context)!.bookDescription}: ',
                        )),
                    Expanded(
                        child: Text(
                      thumbs[index].description ?? '-',
                      style: PersianFonts.Sahel.copyWith(
                          fontSize: 12, color: Colors.grey),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ))
                  ]),
                  Row(children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          style: const TextStyle(fontSize: 11),
                          '${AppLocalizations.of(context)!.bookSummary}: ',
                        )),
                    Expanded(
                        child: Text(
                      thumbs[index].lectureBody ?? '-',
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: PersianFonts.Sahel.copyWith(
                          fontSize: 12, color: Colors.grey),
                    ))
                  ]),
                  Row(children: [
                    Text(
                      style: const TextStyle(fontSize: 11),
                      '${AppLocalizations.of(context)!.author}: ',
                    ),
                    Expanded(
                        child: Text(
                      thumbs[index].author ?? '-',
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: PersianFonts.Sahel.copyWith(
                          fontSize: 12, color: Colors.grey),
                    ))
                  ])
                ])),
              ]),
              onTap: () {
                Navigator.pop(context);
              },
            )),
            scrollDirection: Axis.vertical,
          );
        } else {
          return Text(AppLocalizations.of(context)!.listIsEmpty);
        }
      },
    );
  }
}
