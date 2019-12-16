import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flip_card/flip_card.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'utils/buildin_transformers.dart';

class Questions extends StatefulWidget {
  final String deck;
  final String type;
  Questions(this.deck, this.type);

  @override
  QuestionsState createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {

  Map data;
  List questionsData;

  Future getData() async {
    http.Response response = await http.get("http://13.114.171.232/${widget.deck}/N5/${widget.type}");
    data = json.decode(response.body);
    setState(() {
      questionsData = data["results"];
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
        Colors.redAccent,
        Colors.blueAccent,
        Colors.greenAccent
      ];

      questionsData.shuffle();

      return Scaffold(
          appBar: AppBar(
            title: Text(widget.deck),
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
                              "${questionsData[index]["Question"]}",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 80.0, color: Colors.black),
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
                                "${questionsData[index]["Answer"]}",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 80.0, color: Colors.black),
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
          title: Text(widget.deck),
          backgroundColor: Colors.teal,
        ),
      );
    }
  }
}