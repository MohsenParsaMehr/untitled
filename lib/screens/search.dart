import 'dart:ui';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/widgets/bottom_sheet_popup.dart';
import 'package:untitled/widgets/search_options_widget.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  static const routeName = '/Search';
  @override
  SearchWidgetState createState() => SearchWidgetState();
}

class SearchWidgetState extends State<Search> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(children: [
            Text(
              AppLocalizations.of(context)!.search,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
                onPressed: () => BottomSheetPopUp.show(
                    context, SearchOptionsWidget(const Key('Search_Options'))),
                icon: const Icon(Icons.arrow_drop_down))
          ]),
          actions: [
            // TextField(
            //     //expands: true,
            //     enabled: true,
            //     controller: TextEditingController(
            //         text: AppLocalizations.of(context)!.search),
            //     autofocus: true,
            //     cursorColor: Colors.green,
            //     enableSuggestions: true),
            PopupMenuButton<int>(
              //onSelected: (item) => handleClick(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 0,
                    child: Text(AppLocalizations.of(context)!.listIsEmpty)),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
            child: GestureDetector(
          child: Card(
              color: Colors.grey.withOpacity(0.8),
              surfaceTintColor: Colors.grey,
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
                        image: const AssetImage(
                            'assets/images/art-back (3).jpg'))),
                padding: const EdgeInsets.all(12),
                child: const FlutterLogo(),
              )),
          onTap: () {},
          onHorizontalDragEnd: (details) {
            if (!details.primaryVelocity!.isNegative) {
              const snackBar = SnackBar(
                content: Text('to right'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {});
            } else {
              setState(() {});
            }
          },
        )));
  }
}
