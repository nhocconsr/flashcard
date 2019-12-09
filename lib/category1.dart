import 'package:flutter/material.dart';
import 'package:httptest_app/category2.dart';
import './category2.dart';

class Category1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Category',
      // initialRoute: '/',
      routes: {
        '/category2': (context) => Category2(),       
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Category')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final titles = ['Art', 'Business', 'Culture', 'Language',
 'History', 'Math', 'Music'];
  final icons = [Icons.directions_bike, Icons.directions_boat,
  Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
  Icons.directions_run, Icons.directions_subway];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
  return RaisedButton(
      onPressed: (){
        Navigator.pushNamed(context, '/category2');
        // Navigator.pop(context);
      },
        child:  Card( 
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(titles[index]),
          ),
        )
      );
    },
  );
}
