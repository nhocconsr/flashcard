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
    const Item('Standard',Icon(Icons.android,color:  const Color(0xFF167F67),)),
    const Item('Universal',Icon(Icons.flag,color:  const Color(0xFF167F67),)),
  ];
  List<Item> types = <Item>[
    const Item('Vocabulary',Icon(Icons.android,color:  const Color(0xFF167F67),)),
    const Item('Kanji',Icon(Icons.flag,color:  const Color(0xFF167F67),)),
    const Item('Hiragana',Icon(Icons.android,color:  const Color(0xFF167F67),)),
    const Item('Katakana',Icon(Icons.flag,color:  const Color(0xFF167F67),)),
  ];

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:  Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF167F67),
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
                            fontSize: 18.0, color: Colors.black),
                      ),
                      DropdownButton<Item>(
                        hint:  Text("Select item"),
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
                                  style:  TextStyle(color: Colors.black),
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
                          fontSize: 18.0, color: Colors.black),
                    ),
                    DropdownButton<Item>(
                      hint:  Text("Select item"),
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
                                style:  TextStyle(color: Colors.black),
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
                      builder: (context) => Questions(selectedDeck.name, selectedType.name),
                    ));
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.green[500],
                  child: Text('Start', style: TextStyle(color: Colors.white,fontSize: 20)),
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