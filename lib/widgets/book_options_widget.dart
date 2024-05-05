import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookOptionsWidget extends StatefulWidget {
  BookOptionsWidget(Key key) : super(key: key);

  @override
  State<BookOptionsWidget> createState() => _BookOptionsWidgetState();
}

class _BookOptionsWidgetState extends State<BookOptionsWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(children: [
          TabBar(
            //unselectedLabelColor: Colors.black,
            //labelColor: Colors.red,
            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.searchIn,
              ),
              Tab(
                text: AppLocalizations.of(context)!.sortOptions,
              )
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Expanded(
                    child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                        leading:
                            Checkbox(value: true, onChanged: (checked) => {}),
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
                        leading:
                            Checkbox(value: true, onChanged: (checked) => {}),
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
                        leading:
                            Checkbox(value: true, onChanged: (checked) => {}),
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
                        leading:
                            Checkbox(value: true, onChanged: (checked) => {}),
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
                )),
                Text('Person')
              ],
            ),
          ),
        ]));
  }
}
