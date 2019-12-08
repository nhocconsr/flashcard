import 'package:flutter/material.dart';
import './BeginnerQestions.dart';

class Category2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second Category',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Second Category')),
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

    // replace this function with the code in the examples
  Widget _myListView(BuildContext context) {

      final titles = ['Arabic', 'Chinese', 'English', 'French',
      'German', 'Japanese', 'Korean', 'Russian', 'Spanish'];

      final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

      return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {


         return RaisedButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Questions("Beginner World"),
              ),
            );
          },
            child:  Card( //                           <-- Card widget
            child: ListTile(
              leading: Icon(icons[index]),
              title: Text(titles[index]),
            ),
          )
        );
        },
      );
    }


    