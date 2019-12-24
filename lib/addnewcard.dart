import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final String question;
  final String answer;
  final String type;
  final String jlpt;
  final String difficulty;
  final bool recognize;

  Post({
    this.question,
    this.answer,
    this.type,
    this.jlpt,
    this.difficulty,
    this.recognize,
  });

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      question: json['Question'],
      answer: json['Answer'],
      type: json['Type'],
      jlpt: json['JLPT'],
      difficulty: json['Difficulty'],
      recognize: json['Recognize'],
    );
  }
}

class Home extends StatefulWidget {
  static String tag = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> type = ["Vocabulary", "Kanji", "Hiragana", "Katakana"];
  String _type = "Vocabulary";

  List<String> difficulty = ["Easy", "Intermediate", "Advanced"];
  String _difficulty = "Easy";

  TextEditingController controllerQuestion = new TextEditingController();
  TextEditingController controllerAnswer = new TextEditingController();

  void setType(String value){
    setState(() {
      _type = value;
    });
  }

  void setDifficulty(String value){
    setState(() {
      _difficulty = value;
    });
  }

  void successmessage() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Center(
          child: Text("Successfully Added!",style: TextStyle(fontSize: 20),),
        ),
      ),
    );
    showDialog(context: context,child: alertDialog);
  }

  void confirmdata() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Question : ${controllerQuestion.text}", style: TextStyle(fontSize: 20),),
            new Text("Answer : ${controllerAnswer.text}", style: TextStyle(fontSize: 20),),
            new Text("Type : $_type", style: TextStyle(fontSize: 20),),
            new Text("Difficulty : $_difficulty",style: TextStyle(fontSize: 20),),
            new Padding(padding: new EdgeInsets.fromLTRB(10, 10, 10, 20),),
            new Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
              children: <Widget>[
                new RaisedButton(
                  child: new Text("Add Card"),
                  onPressed: () {
                    _createPost();
                    Navigator.pop(context);
                    successmessage();
                  },
                ),
                new RaisedButton(
                  child: new Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
    showDialog(context: context,child: alertDialog);
  }

  void _createPost() async {
    final response = await http.post(
      'http://api.lexiverse.noi22.com/universal',
      body: jsonEncode(
        {
          'Question': controllerQuestion.text,
          'Answer': controllerAnswer.text,
          'Type': _type,
          'JLPT': "N5",
          'Difficulty': _difficulty,
          'Recognize': true,
        },
      ),
      headers: {'Content-Type': "application/json"},
    );

    final Post parsedResponse = Post.fromJSON(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, 
          ),
        title: new Text("Add Card",style: TextStyle(color: Colors.white,)),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),

      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.fromLTRB(40, 60, 40, 0),),
            new TextField(
              maxLines: 3,
              controller: controllerQuestion,
              decoration: new InputDecoration(
                  hintText: "Question",
                  labelText: "Question",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                  )
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new TextField(
              maxLines: 3,
              controller: controllerAnswer,
              decoration: new InputDecoration(
                  hintText: "Answer",
                  labelText: "Answer",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                  )
              ),
            ),
            new Row(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.fromLTRB(40, 60, 40, 0),),
                new Text("Type     ", style: new TextStyle(fontSize: 20.0, color: Colors.black),),
                new DropdownButton(
                  onChanged: (String value) {
                    setType(value);
                  },
                  value: _type,
                  items: type.map((String value){
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.fromLTRB(40, 60, 40, 0),),
                new Text("Difficulty     ", style: new TextStyle(fontSize: 20.0, color: Colors.black),),
                new DropdownButton(
                  onChanged: (String value) {
                    setDifficulty(value);
                  },
                  value: _difficulty,
                  items: difficulty.map((String value){
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
            new RaisedButton(
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                child: new Text("Review",style: TextStyle(color: Colors.grey, fontSize: 23),),
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                color: Colors.limeAccent,
                onPressed: (){confirmdata();}
            )
          ],
        ),

      ),
    );
  }
}