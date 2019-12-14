// import 'package:duelingo_flashcard/services/auth.dart';
// import 'package:flutter/material.dart';

// class SignIn extends StatefulWidget{
//   @override 
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn>{
//   final AuthService _auth = AuthService();

// //text field state
// String email = "";
// String password = "";

//   @override
//   Widget build(BuildContext context) {

//     final logo = Hero(
//       tag: 'hero',
//       child: CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 100.0,
//         child: Image.asset('assets/duelingo.png'),
//         )
//     );

//       final loginButton = Padding(
//       padding: EdgeInsets.symmetric(vertical:1),
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         onPressed: () {
//          print(email);
//          print(password);
//         },
//         padding: EdgeInsets.all(10),
//         color: Colors.cyan[500],
//         child: Text('Sign In', style: TextStyle(color: Colors.white,fontSize: 20)),
//       ),
//     );


//        final signUpButton = Padding(
//       padding: EdgeInsets.symmetric(vertical: 1),
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         onPressed: () async {

//         },
//         padding: EdgeInsets.all(10),
//         color: Colors.orange[300],
//         child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 20))
//       ),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//           child: Form(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 30.0),
//                 logo,
//                 SizedBox(height: 25.0),
//                 TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   autofocus: false,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(32)
//                           )
//                         ),
//                   onChanged: (val){
//                     setState(() => email = val);
//                   },
//                       ),
//                 SizedBox(height: 15.0),
//                 TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   autofocus: false,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       hintText: 'Passward',
//                       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                       border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(32)
//                     )
//                   ),
//                   onChanged: (val){
//                     setState(() => password = val);},
//                 ),
//                  SizedBox(height: 25.0),
//                 loginButton,
//                 signUpButton
//               ],
//             ),
//           )
//         ),
//       ),
//     );
//   }
// }