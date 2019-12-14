import 'package:duelingo_flashcard/services/auth.dart';
import 'package:duelingo_flashcard/wrapper.dart';
import 'package:flutter/material.dart';
import './category1.dart';
import './toppage.dart';
import 'package:provider/provider.dart';
import './models/user.dart';

// void main() {
//   runApp(MaterialApp(
//    home: new Login(),
//   ));
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final routes = <String, WidgetBuilder>{
  //   Login.tag: (context) => Login(),
  //   Category1.tag: (context) => Category1(),
  // };

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value:AuthService().user,
        child: MaterialApp(
        // title: 'duelingo',
        // debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.cyan,
        //   fontFamily: 'Nunito',
        // ),
        home: Login(),
        // routes: routes,
      ),
    );
  }
}
  