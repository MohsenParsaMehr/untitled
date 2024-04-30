import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchOptionsWidget extends StatelessWidget {
  const SearchOptionsWidget(Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(AppLocalizations.of(context)!.searchIn),
      Expanded(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
              leading: Checkbox(value: true, onChanged: (checked) => {}),
              title: Expanded(
                  child: Row(children: [
                const Icon(
                  Icons.done_all_rounded,
                  color: Colors.green,
                ),
                const Padding(padding: EdgeInsets.only(left: 7)),
                Text(
                  AppLocalizations.of(context)!.allContent,
                  style: const TextStyle(fontSize: 12),
                )
              ])),
              onTap: () {}),
          ListTile(
              leading: Checkbox(value: true, onChanged: (checked) => {}),
              title: Expanded(
                  child: Row(children: [
                const Icon(
                  Icons.menu_book,
                  color: Colors.green,
                ),
                const Padding(padding: EdgeInsets.only(left: 7)),
                Text(
                  AppLocalizations.of(context)!.books,
                  style: const TextStyle(fontSize: 12),
                )
              ])),
              onTap: () {}),
          ListTile(
              leading: Checkbox(value: true, onChanged: (checked) => {}),
              title: Expanded(
                  child: Row(children: [
                const Icon(
                  Icons.mic_external_on,
                  color: Colors.green,
                ),
                const Padding(padding: EdgeInsets.only(left: 7)),
                Text(
                  AppLocalizations.of(context)!.lectures,
                  style: const TextStyle(fontSize: 12),
                )
              ])),
              onTap: () {}),
          ListTile(
              leading: Checkbox(value: true, onChanged: (checked) => {}),
              title: Expanded(
                  child: Row(children: [
                const Icon(
                  Icons.format_align_center_rounded,
                  color: Colors.green,
                ),
                const Padding(padding: EdgeInsets.only(left: 7)),
                Text(
                  AppLocalizations.of(context)!.poems,
                  style: const TextStyle(fontSize: 12),
                )
              ])),
              onTap: () {}),
          ListTile(
              leading: Checkbox(
                  checkColor: Colors.green,
                  value: true,
                  onChanged: (checked) => {}),
              title: Expanded(
                  child: Row(children: [
                const Icon(
                  CupertinoIcons.hand_raised_fill,
                  color: Colors.green,
                ),
                const Padding(padding: EdgeInsets.only(left: 7)),
                Text(
                  AppLocalizations.of(context)!.prays,
                  style: const TextStyle(fontSize: 12),
                )
              ])),
              onTap: () {}),
        ],
      ))
    ]);
  }
}
