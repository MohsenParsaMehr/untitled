import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/screens/questionAndAnswers.dart';
import 'screens/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(const GreenLightApp());
}

class GreenLightApp extends StatelessWidget {
  const GreenLightApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(

      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      /*supportedLocales: const [
        Locale('en'), // English
        Locale('fa'), // farsi
      ],*/
      locale: const Locale('en', 'US'),
      theme: theme.copyWith(colorScheme: theme.colorScheme.copyWith(primary: Colors.green[900],
      secondary: Colors.green[700]))
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
      ,home: MyHomePage(title: 'Green Light'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

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
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
    });
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(

          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(0),
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [  Icon( Icons.account_circle,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Register User'),SizedBox(width: 10),Text('Guest'), Icon( Icons.settings,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Register User') ]) ,
            ),
            ListTile(
              title:  Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [const Icon( Icons.account_circle,
                color: Colors.black54,
                size: 24.0,

                semanticLabel: 'Register User'),const SizedBox(width: 10) , Text(AppLocalizations.of(context)!.helloWorld )]) ,
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.book,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Books'),SizedBox(width: 10) , Text('Books')]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.speaker_group,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Lectures'),SizedBox(width: 10) , Text('Lectures')]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.question_answer,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'FAQs'),SizedBox(width: 10) , Text('FAQs')]),
              onTap: () {
                // Update the state of the app.
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) =>  questionAndAnswers()));
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.favorite,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Favorites'),SizedBox(width: 10) , Text('Favorites')]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.photo_album,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Gallery') ,SizedBox(width: 10), Text('Gallery')]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.interpreter_mode,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Interprets'),SizedBox(width: 10) , Text('Interprets')]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.add_comment_rounded,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Poems') ,SizedBox(width: 10), Text('Poems')]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon( Icons.adjust,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Concepts'),SizedBox(width: 10) , Text('Concepts')]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon( Icons.telegram,
                      color: Colors.black54,
                      size: 24.0,
                      semanticLabel: 'Telegram'),SizedBox(width: 10) ,
                    Icon( Icons.telegram,
                        color: Colors.black54,
                        size: 24.0,
                        semanticLabel: 'Instagram'),SizedBox(width: 10) ,
                    Icon( Icons.telegram,
                        color: Colors.black54,
                        size: 24.0,
                        semanticLabel: 'Skyroom'),SizedBox(width: 10) ]),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:  Text(widget.title),
        actions: [IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) =>  Container())),
            icon: const Icon(Icons.search))],
      ),
      body:
      const SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:   home( Key('1')))    ,
      floatingActionButton: FloatingActionButton(
        onPressed: _onTipPressed,
        tooltip: 'نکته روز',
        child: const Icon(Icons.tips_and_updates),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
