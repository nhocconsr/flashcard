import 'package:flutter/material.dart';
import './BeginnerQestions.dart';
import './addnewcard.dart';

class DropdownScreen extends StatefulWidget {
  State createState() =>  DropdownScreenState();
}

class DropdownScreenState extends State<DropdownScreen> {
  List decks = ['Standard', 'Universal'];
  List types = ['Vocabulary', 'Kanji', 'Hiragana', 'Katakana'];

  String selectedDeck = 'Standard';
  String selectedType = 'Vocabulary';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            // backgroundColor: const Color(0xFF167F67),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body:  Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Column(
                    children: [
                      Text(
                        "Deck",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 32.0, color: Colors.black),
                      ),
                      DropdownButton(
                        hint:  Text("Select item"),
                        value: selectedDeck,
                        onChanged: (Value) {
                          setState(() {
                            selectedDeck = Value;
                          });
                        },
                        items: decks.map((deck) {
                          return  DropdownMenuItem(
                            value: deck,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 8,),
                                Text(
                                  deck,
                                  style:  TextStyle(color: Colors.black, fontSize: 23),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ]
                ),
                Column(
                  children: [
                    Text(
                      "Type",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 32.0, color: Colors.black),
                    ),
                    DropdownButton(
                      hint:  Text("Select item"),
                      value: selectedType,
                      onChanged: (Value) {
                        setState(() {
                          selectedType = Value;
                        });
                      },
                      items: types.map((type) {
                        return  DropdownMenuItem(
                          value: type,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 8,),
                              Text(
                                type,
                                style:  TextStyle(color: Colors.black, fontSize: 23),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
//                Navigator.of(context).pushNamed(Category1.tag);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Questions(selectedDeck, selectedType),
                    ));
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.green[500],
                  child: Text('Start', style: TextStyle(color: Colors.white,fontSize: 35)),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Text("Add", style: TextStyle(color: Colors.white,fontSize: 15,)),
            onPressed: () {
              Navigator.of(context).pushNamed(Home.tag);
            },
          ),
        )
    );
  }
}