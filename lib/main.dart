import 'package:flutter/material.dart';
import 'package:httptest_app/category1.dart';
import './login.dart';

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
  