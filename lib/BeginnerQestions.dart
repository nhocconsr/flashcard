import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flip_card/flip_card.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'utils/buildin_transformers.dart';


class Questions extends StatefulWidget {
  final String name;
  Questions(this.name);

  @override
  QuestionsState createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {

  List data;
  List questionsData;

  Future getData() async {
    http.Response response = await http.get("http://54.250.202.29/questions");
    data = json.decode(response.body);
    setState(() {
      questionsData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (questionsData != null) {

      List<Color> list = [
        Colors.blue[50],
        Colors.blue[100],
        Colors.blue[200]
      ];
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.name),
            backgroundColor: Colors.teal,
          ),
          body:
          TransformerPageView(
              loop: true,
              transformer: new ZoomOutPageTransformer(),
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  child: new Center(
                    child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Card(
                          color: list[index % list.length],
                          child:Center(
                            child: Text(
                              "${questionsData[index]["question"]}",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 40.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      back: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Card(
                            color: Colors.lime,
                            child: Center(
                              child: Text(
                                "${questionsData[index]["answer"]}",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 40.0, color: Colors.black),
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                );
              },
              itemCount: questionsData.length)
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: Colors.teal,
        ),
      );
    }
  }
}