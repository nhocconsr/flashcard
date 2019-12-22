import 'package:flutter/material.dart';
import './addnewcard.dart';
import './selectFlashcards.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Home.tag: (context) => Home(),

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lexiverse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Nunito',
      ),
      home: DropdownScreen(),
      routes: routes,
    );
  }
}
  