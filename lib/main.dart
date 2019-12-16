import 'package:flutter/material.dart';
import './category1.dart';
import './addnewcard.dart';
import './login.dart';
import './selectFlashcards.dart';

// void main() {
//   runApp(MaterialApp(
//    home: new Login(),
//   ));
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    Category1.tag: (context) => Category1(),
    Home.tag: (context) => Home(),

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'duelingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Nunito',
      ),
      home: Login(),
      routes: routes,
    );
  }
}
  