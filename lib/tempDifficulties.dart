import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';


class Difficulties extends StatelessWidget {
  @override
   Widget build(BuildContext context) => 
    MaterialApp(
      title: 'Difficulties',
      // routes: {

      // },
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
        body: Text('hello world'),
      ),

    );
 


}