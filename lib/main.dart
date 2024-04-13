import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/screens/questionAndAnswers.dart';
import 'package:untitled/screens/search.dart';
import 'package:untitled/settings/settings_controller.dart';
import 'package:untitled/settings/settings_service.dart';
import 'package:untitled/settings/settings_view.dart';
import 'package:untitled/utilities/settings.dart';
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
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/images/art-back.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.2)),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/logo.png'))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton.outlined(
                        onPressed: () => {
                          Navigator.restorablePushNamed(
                              context, SettingsView.routeName)
                        },
                        icon: const Icon(Icons.account_circle_rounded),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Text(AppLocalizations.of(context)!.guest),
                      IconButton.outlined(
                        onPressed: () => {
                          Navigator.restorablePushNamed(
                              context, SettingsView.routeName)
                        },
                        icon: const Icon(Icons.settings_rounded),
                      ),
                    ]),
              ),
              ListTile(
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.menu_book_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                      semanticLabel: 'Books'),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.books)
                ]),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),

              ListTile(
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.mic_external_on_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                      semanticLabel: 'Lectures'),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.lectures)
                ]),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.question_answer_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                      semanticLabel: 'FAQs'),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.questionAndAnswers)
                ]),
                onTap: () {
                  // Update the state of the app.
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => questionAndAnswers()));
                },
              ),
              ListTile(
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.favorite_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                      semanticLabel: 'Favourites'),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.favourites)
                ]),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),

              ListTile(
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.interpreter_mode_rounded,
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
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.add_comment_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                      semanticLabel: 'Poems'),
                  const SizedBox(width: 10),
                  Text(AppLocalizations.of(context)!.poems)
                ]),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.photo_album_rounded,
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
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
              //ListTile(
              //title:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ),
      ),
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
                    if (Settings.language == 'fa')
                      {
                        Settings.language = 'en',
                        Settings.country = 'US',
                      }
                    else
                      {
                        Settings.language = 'fa',
                        Settings.country = 'IR',
                      },
                    showModalBottomSheet(
                      showDragHandle: true,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12)), //for the round edges
                      builder: (context) {
                        return ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            ListTile(
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.translate_sharp,
                                        color: Theme.of(context).primaryColor,
                                        size: 24.0,
                                        semanticLabel: 'Concepts'),
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
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.translate_sharp,
                                        color: Theme.of(context).primaryColor,
                                        size: 24.0,
                                        semanticLabel: 'Concepts'),
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
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.translate_sharp,
                                        color: Theme.of(context).primaryColor,
                                        size: 24.0,
                                        semanticLabel: 'Concepts'),
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
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.translate_sharp,
                                        color: Theme.of(context).primaryColor,
                                        size: 24.0,
                                        semanticLabel: 'Concepts'),
                                    const SizedBox(width: 10),
                                    const Text('اللغة العربية')
                                  ]),
                              onTap: () {
                                // Update the state of the app.
                                // ...
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                      context: context,
                      isDismissible: true,
                      isScrollControlled: false,
                    ),
                    setState(() => _locale = Locale(Settings.locale)),
                  }),
              icon: const Icon(Icons.language_rounded))
        ],
      ),
      body: const SafeArea(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Home(Key('1'))),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTipPressed,
        tooltip: 'نکته روز',
        child: const Icon(Icons.tips_and_updates),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
