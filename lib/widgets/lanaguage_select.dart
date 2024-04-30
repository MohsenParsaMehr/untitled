import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelectWidget extends StatelessWidget {
  const LanguageSelectWidget(Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(AppLocalizations.of(context)!.selectLanguage),
      Expanded(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'Persian'),
              const SizedBox(width: 10),
              const Text('فارسی')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'English'),
              const SizedBox(width: 10),
              const Text('English')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'Kurdi'),
              const SizedBox(width: 10),
              const Text('کوردی')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'Arabic'),
              const SizedBox(width: 10),
              const Text('اللغة العربية')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'chiness'),
              const SizedBox(width: 10),
              const Text('中国人')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'French'),
              const SizedBox(width: 10),
              const Text('Français')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'Indian'),
              const SizedBox(width: 10),
              const Text('भारतीय')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.translate_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                  semanticLabel: 'Deutsch'),
              const SizedBox(width: 10),
              const Text('Deutsch')
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
        ],
      ))
    ]);
  }
}
