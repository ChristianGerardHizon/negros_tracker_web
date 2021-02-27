import 'package:flutter/material.dart';
import 'package:negros_tracker_website/src/screens/screens.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NegrosTracker',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff283343),
        primaryColor: Color(0xff37BC9B),
      ),
      home: HomePage(),
    );
  }
}
