import 'package:flutter/material.dart';
import 'package:untitled/data/APILecturesQuery.dart';

class BottomSheetPopUp {
  static Future<int?> show(
      BuildContext context, List<APILecturesQuery> thumbs) {
    Future<int?> result = showModalBottomSheet<int>(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)), //for the round edges
      builder: (context) {
        return ListView.builder(
          itemCount: thumbs.length,
          itemBuilder: (context2, index) => (ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'Concepts'),
              const SizedBox(width: 10),
              Text(thumbs[index].topic)
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
