import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:untitled/data/lecture_dto.dart';
import 'package:untitled/utilities/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomSheetPopUp {
  static Future<int?> show(BuildContext context, List<LectureDto> thumbs) {
    Future<int?> result = showModalBottomSheet<int>(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)), //for the round edges
      builder: (context) {
        return ListView.separated(
          itemCount: thumbs.length,
          separatorBuilder: (context, index) => (const Divider(
            thickness: 1,
            color: Colors.black38,
            height: 5,
          )),
          itemBuilder: (context2, index) => (ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              // Icon(Icons.menu_book,
              //     color: Theme.of(context).primaryColor,
              //     size: 24.0,
              //     semanticLabel: 'Books'),
              // const SizedBox(width: 10),
              CachedNetworkImage(
                alignment: Alignment.topCenter,
                imageUrl:
                    "${Settings.protocol}://${Settings.baseUrl}/Images/Covers/${thumbs[index].captionImageUrl!}",
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 40),
                imageBuilder: (context, imageProvider) {
                  return Ink.image(
                      image: imageProvider,
                      //fit: BoxFit.contain,
                      width: 128,
                      height: 128);
                },
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
              Expanded(
                  child: Column(children: [
                Text(
                  thumbs[index].topic,
                ),
                Row(children: [
                  Text(
                    '${AppLocalizations.of(context)!.bookDescription}: ',
                  ),
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
                  Text(
                    '${AppLocalizations.of(context)!.bookSummary}: ',
                  ),
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
      },
      context: context,
      isDismissible: true,
      isScrollControlled: false,
    );
    return result.then((int? value) => value);
  }
}
