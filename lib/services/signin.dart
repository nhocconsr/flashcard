import 'package:duelingo_flashcard/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget{
  @override 
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>{
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title:Text("sign in to ..."),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text(' Sign in anon'),
          onPressed: () async {
             dynamic result =  await _auth.signInAnon();
             if(result == null ){
               print('error signing in');
             }else{
               print('signed in');
               print(result);
             }
          },),
      ),
    );
  }
}