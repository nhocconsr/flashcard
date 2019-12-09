import 'package:flutter/material.dart';
import './tempDifficulties.dart';

class Category2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second Category',
      initialRoute: '/',
      routes: {
        '/difficulties': (context) => Difficulties(),       
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sub Category'),
          leading: IconButton(icon: Icon(Icons.navigate_before),
            onPressed: () => Navigator.pop(context, false) ,
           ),
          ),
        body: BodyPartsOfSubCategory(),
       )
     );
  }
}

class BodyPartsOfSubCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _myListView(context);
}

Widget _myListView(BuildContext context) {
  final subCategories = ['Arabic', 'Chinese', 'English', 'French',
  'German', 'Japanese', 'Korean', 'Russian', 'Spanish'];
  final icons = [Icons.directions_bike, Icons.directions_boat,
  Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
  Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
  Icons.directions_walk];

  return ListView.builder(
    itemCount: subCategories.length,
    itemBuilder: (context, index) {
  return RaisedButton(
      onPressed: (){
        Navigator.pushNamed(context, '/difficulties');
      },
        child:  Card( 
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(subCategories[index]),
          ),
        )
      );
    },
  );
}
