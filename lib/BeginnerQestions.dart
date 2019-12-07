import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flip_card/flip_card.dart';




class Questions extends StatefulWidget {
  final String name;
  Questions(this.name);

  @override
  QuestionsState createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  final String url = "http://54.250.202.29/questions";
  List data;
  int _index = 0;

  Future<String> getSWData() async {
    var res =
    await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody;
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     FlipCard(
                      direction: FlipDirection.HORIZONTAL, // default
                      front: Card(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Text("Question: "),
                              Text(data[_index]["question"],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                            ],
                          )),
                      ),
                      back: Card(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Text("Answer: "),
                              Text(data[_index]["answer"],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                            ],
                          )
                        ),
                      ),
                  )
                ],
              ),
            ),
          ),
        floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _decrementIndex,
                    child: Icon(Icons.navigate_before),
              ),
                  FloatingActionButton(
                    onPressed: _incrementIndex,
                    child: Icon(Icons.navigate_next),
              )
            ],
          ),
        )
         );
  }

  void _decrementIndex() {
    setState(() {
      _index--;
    });
   }

  void _incrementIndex() {
    setState(() {
      _index++;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}