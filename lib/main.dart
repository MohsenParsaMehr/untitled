import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/screens/books.dart';
import 'package:untitled/screens/favourites.dart';
import 'package:untitled/screens/narrations.dart';
import 'package:untitled/screens/poems.dart';
import 'package:untitled/screens/search.dart';
import 'package:untitled/screens/web_view.dart';
import 'package:untitled/settings/settings_controller.dart';
import 'package:untitled/settings/settings_service.dart';
import 'package:untitled/settings/settings_view.dart';
import 'package:untitled/utilities/settings.dart';
import 'package:untitled/widgets/bottom_sheet_popup.dart';
import 'package:untitled/widgets/lanaguage_select.dart';
import 'greenlight_theme.dart';
import 'screens/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  HttpOverrides.global = MyHttpOverrides();
  runApp(GreenLightApp(settingsController: settingsController));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

final theme = GreenLightTheme.dark();

class GreenLightApp extends StatefulWidget {
  const GreenLightApp({
    super.key,
    required this.settingsController,
  });
  static const routeName = '/';
  final SettingsController settingsController;
  @override
  State<GreenLightApp> createState() => _GreenLightAppState();
}

Locale _locale = Locale(Settings.language, Settings.country);

class _GreenLightAppState extends State<GreenLightApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        theme:
            theme, // theme.copyWith(colorScheme: theme.colorScheme.copyWith(primary: Colors.green[900],      secondary: Colors.green[700]))
        //ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
        //)
        home: const MyHomePage(title: 'New App'),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case Favourites.routeName:
                  return const Favourites(Key('favourites'));
                case Books.routeName:
                  return const Books(Key('books'));
                case Search.routeName:
                  return const Search();
                case Narrations.routeName:
                  return const Narrations(Key('narrations'));
                case Poems.routeName:
                  return const Poems(Key('poems'));
                case SettingsView.routeName:
                  return SettingsView(controller: widget.settingsController);
                default:
                  return SettingsView(controller: widget.settingsController);
              }
            },
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Home(Key('home')),
    const WebView(Key('Web View')),
    const Home(Key('home')),
  ];
  void _onTipPressed() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawerScrimColor: Colors.white.withOpacity(0.2),
      drawer: Drawer(
          //child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: const AssetImage('assets/images/logo.png'),
          //         colorFilter: ColorFilter.mode(
          //             Colors.black.withOpacity(0.05), BlendMode.dstATop),
          //         fit: BoxFit.fill,
          //         opacity: 0.2)),
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 17.0 * 0.12, sigmaY: 17.0 * 0.12),
        child: ListView(
          // Important: Remove any padding from the ListView.
          //padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/logo.png'))),
                child: Padding(
                  padding: EdgeInsets.all(0),
                )),
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  //const Padding(padding: EdgeInsets.only(top: 50)),
                  IconButton.outlined(
                    onPressed: () => {
                      Navigator.restorablePushNamed(
                          context, SettingsView.routeName)
                    },
                    icon: Icon(Icons.account_circle, color: Colors.green[100]),
                  ),

                  Text(
                    AppLocalizations.of(context)!.guest,
                    style: const TextStyle(fontSize: 12),
                  ),

                  IconButton.outlined(
                    onPressed: () => {
                      Navigator.restorablePushNamed(
                          context, Favourites.routeName)
                    },
                    icon: Icon(
                      Icons.favorite_outline_outlined,
                      color: Colors.green[100],
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.favourites,
                      style: const TextStyle(fontSize: 12)),
                  IconButton.outlined(
                    onPressed: () => {
                      Navigator.restorablePushNamed(
                          context, SettingsView.routeName)
                    },
                    icon: Icon(
                      Icons.settings_rounded,
                      color: Colors.green[100],
                    ),
                  ),
                  // Text(AppLocalizations.of(context)!.settings,
                  //     style: const TextStyle(fontSize: 12)),
                ]),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.menu_book,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Books'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.books)
              ]),
              onTap: () {
                Navigator.restorablePushNamed(context, Books.routeName);
              },
            ),

            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.mic_external_on,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Lectures'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.lectures)
              ]),
              onTap: () {
                Navigator.restorablePushNamed(context, Narrations.routeName);
              },
            ),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(CupertinoIcons.bubble_left_bubble_right_fill,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'FAQs'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.questionAndAnswers)
              ]),
              onTap: () {
                // Update the state of the app.
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (_) => questionAndAnswers()));
              },
            ),

            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.interpreter_mode,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Interprets'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.interprets)
              ]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.format_align_center,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Poems'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.poems)
              ]),
              onTap: () {
                Navigator.restorablePushNamed(context, Poems.routeName);
              },
            ),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.photo,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Gallery'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.gallery)
              ]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.pix_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Concepts'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.concepts)
              ]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.account_tree_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Hierarchy'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.hierarchy)
              ]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.kebab_dining_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'Hierarchy'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.counter)
              ]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.man,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                    semanticLabel: 'My Deeds'),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.myDeeds)
              ]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            //ListTile(
            //title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton.outlined(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.telegram,
                    color: Theme.of(context).primaryColor,
                  )),
              const SizedBox(width: 10),
              IconButton.outlined(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.telegram_rounded,
                    color: Theme.of(context).primaryColor,
                  )),
              const SizedBox(width: 10),
              IconButton.outlined(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.share_rounded,
                    color: Theme.of(context).primaryColor,
                  )),
              const SizedBox(width: 10)
            ]),
            //onTap: () {                 },
          ],
        ),
      )),

      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(
          AppLocalizations.of(context)!.greenLight,
          style: theme.textTheme.bodyLarge,
        ),

        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Search())),
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () => ({
                    BottomSheetPopUp.show(context,
                        const LanguageSelectWidget(Key('Language_Select')))
                  }),
              icon: const Icon(CupertinoIcons.globe))
        ],
      ),
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 24,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.web_rounded),
                label: AppLocalizations.of(context)!.web,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_2_rounded),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          )),
      floatingActionButton: (_currentIndex != 1
          ? FloatingActionButton(
              onPressed: _onTipPressed,
              tooltip: 'نکته روز',
              child: const Icon(Icons.tips_and_updates),
            )
          : null), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
