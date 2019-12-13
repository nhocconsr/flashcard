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
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val){

                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val){

                },
              ),
            ],
          ),
        )
      ),
    );
  }
}