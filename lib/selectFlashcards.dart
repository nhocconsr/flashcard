import 'package:flutter/material.dart';
import './BeginnerQestions.dart';
import './addnewcard.dart';

class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}

class DropdownScreen extends StatefulWidget {
  State createState() =>  DropdownScreenState();
}

class DropdownScreenState extends State<DropdownScreen> {
  Item selectedDeck;
  Item selectedJLPT;
  Item selectedType;

  List<Item> decks = <Item>[
    const Item('Standard',Icon(Icons.face, color:  Colors.pinkAccent, size: 25,)),
    const Item('Community',Icon(Icons.language, color:  Colors.pinkAccent, size: 25,)),
  ];
  List<Item> types = <Item>[
    const Item('Vocabulary',Icon(Icons.spellcheck, color: Colors.indigo, size: 25,)),
    const Item('Kanji',Icon(Icons.translate, color:Colors.indigo, size: 25)),
    const Item('Hiragana',Icon(Icons.star_border, color:Colors.indigo, size: 25)),
    const Item('Katakana',Icon(Icons.star, color:Colors.indigo,  size: 25)),
  ];

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:  Scaffold(
          appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Colors.pink[400],
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
              ),
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white, fontFamily: "Futura"),
            ),
          ),),
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
                      DropdownButton<Item>(
                        hint:  Text("Select item", style: TextStyle(color: Colors.black87, fontSize: 20,fontStyle: FontStyle.italic),),
                        value: selectedDeck,
                        onChanged: (Item Value) {
                          setState(() {
                            selectedDeck = Value;
                          });
                        },
                        items: decks.map((Item deck) {
                          return  DropdownMenuItem<Item>(
                            value: deck,
                            child: Row(
                              children: <Widget>[
                                deck.icon,
                                SizedBox(width: 8,),
                                Text(
                                  deck.name,
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
                    DropdownButton<Item>(
                      hint:  Text("Select item", style: TextStyle(color: Colors.black87, fontSize: 20,fontStyle: FontStyle.italic),),
                      value: selectedType,
                      onChanged: (Item Value) {
                        setState(() {
                          selectedType = Value;
                        });
                      },
                      items: types.map((Item type) {
                        return  DropdownMenuItem<Item>(
                          value: type,
                          child: Row(
                            children: <Widget>[
                              type.icon,
                              SizedBox(width: 8,),
                              Text(
                                type.name,
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
//                Navigator.of(context).pushNamed(Category1.tag);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Questions(selectedDeck.name, selectedType.name),
                    ));
                  },
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  color: Colors.cyan[500],
                  child: Text('Start', style: TextStyle(color: Colors.white,fontSize: 35)),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.yellow[800],
            icon: Icon(Icons.library_books),
            label: Text("Add", style: TextStyle(color: Colors.white,fontSize: 20,)),
            onPressed: () {
              Navigator.of(context).pushNamed(Home.tag);
            },
          ),
        )
    );
  }
}