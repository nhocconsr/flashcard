import 'package:flutter/material.dart';
import './BeginnerQestions.dart';


class Difficulties extends StatelessWidget {
  @override
   Widget build(BuildContext context) => 
    MaterialApp(
      title: 'Difficulties',
     routes: {
        '/questions': (context) => Questions('hello'),       
      },
      theme: ThemeData(
        primarySwatch: Colors.teal, //Appbar's color
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Begginer'),
          leading: IconButton(icon: Icon(Icons.navigate_before),
            onPressed: () => Navigator.pop(context, false) ,
             ),
           ),
        body: BodyPartsOfDifficulties(),
      ),
    );
}


class BodyPartsOfDifficulties extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _difficultiesView(context);
}

Widget _difficultiesView(BuildContext context){
  final difficulties = ['Begginer', 'Intermidiate', 'Advanced'];
  final icons = [Icons.star_border, Icons.star_half, Icons.star];

  return ListView.builder(
    itemCount: difficulties.length,
    itemBuilder: (context, index) => RaisedButton(
      onPressed: (){
        Navigator.pushNamed(context, '/questions');
      },
      child: Card(
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(difficulties[index]),
        ),
      ),
    ),
  );
}