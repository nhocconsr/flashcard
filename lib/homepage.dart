import 'package:flutter/material.dart';
import './selectFlashcards.dart';


class Homepage extends StatelessWidget {
  static String tag = 'homepage';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
       initialRoute: '/',
      routes: {
        '/selectFlashcards': (context) => DropdownScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
//                Navigator.of(context).pushNamed('./selectFlashcards');
//             Navigator.pushNamed(context, './selectFlashcards');
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DropdownScreen(),
            )
            );
          },
          padding: EdgeInsets.all(12),
          color: Colors.yellow[500],
          child: Text('show flash card', style: TextStyle(color: Colors.white,fontSize: 20)),
        ),
      ),
    );
  }
}