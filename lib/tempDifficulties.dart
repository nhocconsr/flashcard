import 'package:flutter/material.dart';
import './BeginnerQestions.dart';

class Difficulties extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.cyan,
      title: Text('Difficulties'),
      ),
      body: BodyPartsOfDifficulties(),
    );
  }
} 


class BodyPartsOfDifficulties extends StatelessWidget{
  @override
  Widget build(BuildContext context) => _myDifficultiesView(context);
}

Widget _myDifficuitiesView(BuildContext, context){
  final difficulties = ['Begginer', 'Intermidiate', 'Advanced'];
  final icons = [Icons.star_border, Icons.star_half, Icons.star];
  List<Widget> buttons = [
        RaisedButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Questions("Beginner World"),
              ),
            );
          },
            child: Card(
              elevation: 1, 
             child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
              child: Text("Beginner World",
                style: TextStyle(fontSize: 18) ,
                  ),
                ),
              ),
            ),
        RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Questions(" Intermidiate World"),
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
                    builder: (context) => Questions("Advanced World"),
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
        ];

  return ListView.builder(
    itemCount: difficulties.length,
    itemBuilder: (context, position){
      return Text(buttons[position]);
    },
  )

}

// import 'package:flutter/material.dart';
// import './BeginnerQestions.dart';



// class Difficulties extends StatelessWidget {
//   @override
//    Widget build(BuildContext context) => 
//     MaterialApp(
//       title: 'Difficulties',
//      routes: {
//         '/questions': (context) => Questions(widget.name),    // change to widget.name?
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.teal, //Appbar's color
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Begginer'),
//           leading: IconButton(icon: Icon(Icons.navigate_before),
//             onPressed: () => Navigator.pop(context, false) ,
//              ),
//            ),
//         body: BodyPartsOfDifficulties(),
//       ),
//     );
// }


// class BodyPartsOfDifficulties extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => _difficultiesView(context);
// }

// Widget _difficultiesView(BuildContext context){
//   final difficulties = ['Begginer', 'Intermidiate', 'Advanced'];
//   final icons = [Icons.star_border, Icons.star_half, Icons.star];

//   return ListView.builder(
//     itemCount: difficulties.length,
//     itemBuilder: (context, index) => RaisedButton(
//       onPressed: (){
//         Navigator.pushNamed(context, '/questions');
//       },
//       child: Card(
//         child: ListTile(
//           leading: Icon(icons[index]),
//           title: Text(difficulties[index]),
//         ),
//       ),
//     ),
//   );
// }