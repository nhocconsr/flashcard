import 'package:flutter/material.dart';
import './show_flashcards.dart';
import './add_newcard.dart';

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
          appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Colors.purple[900],
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              ),
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),),
          body:  Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Image.asset('assets/logo_grey_black.png'),
                Column(
                    children: [
                      Text(
                        "Deck",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 32.0, color: Colors.black),
                      ),
                      DropdownButton(
                        hint:  Text("Select item", style: TextStyle(color: Colors.black87, fontSize: 20),),
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
                      hint:  Text("Select item", style: TextStyle(color: Colors.black87, fontSize: 20),),
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Questions(selectedDeck, selectedType),
                    ));
                  },
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  color: Colors.purple[800],
                  child: Text('Start', style: TextStyle(color: Colors.white,fontSize: 23)),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.limeAccent,
            label: Text("Add", style: TextStyle(color: Colors.grey,fontSize: 18,)),
            onPressed: () {
              Navigator.of(context).pushNamed(Home.tag);
            },
          ),
        )
    );
  }
}