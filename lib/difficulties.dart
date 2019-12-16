import 'package:flutter/material.dart';
import './BeginnerQestions.dart';

class Difficulties extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.teal,
      title: Text('Difficulties'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
        RaisedButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Questions("Beginner World", ''),
              ),
            );
          },
            child: Card(
              elevation: 1,
             child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text("Beginner World",
                style: TextStyle(fontSize: 18) ,
                  ),
                ),
              ),
            ),
        RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Questions(" Intermidiate World", ''),
                    ),
                  );
                },
              child: Card(
                elevation: 10,
              child:Padding(
                padding: const EdgeInsets.symmetric (vertical: 10, horizontal: 8),
              child: Text("Intermidiate World",
                style: TextStyle(fontSize: 18) ,
              ),
            ),
          ),
        ),
        RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Questions("Advanced World", ''),
                    ),
                  );
                },
              child: Card(
                elevation: 10,
              child:Padding(
                padding: const EdgeInsets.symmetric (vertical: 10, horizontal: 8),
              child: Text("Advanced World",
                style: TextStyle(fontSize: 18) ,
              ),
            ),
          ),
        ),
        ],)     
      ),
    );
  }
} 