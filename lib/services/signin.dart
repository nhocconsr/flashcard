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

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 88.0,
        child: Image.asset('assets/duelingo.png'),
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        elevation: 0,
        // title:Text(""),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                logo,
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  initialValue: 'example@gmail.com',
                  decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)
                          )
                        ),
                      ),
                SizedBox(height: 30.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  initialValue: 'xxxxxxxxxx',
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Passward',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)
                    )
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}