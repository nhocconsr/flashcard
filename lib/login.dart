import 'package:flutter/material.dart';
import './category1.dart';
import './homepage.dart';
import './selectFlashcards.dart';

class Login extends StatefulWidget {
static String tag = 'login-page';
  @override
   LoginState createState() =>  LoginState();
}

class LoginState extends State<Login> {
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

    final email = TextFormField(
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
    );

    final password = TextFormField(
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
    );

      final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
//          Navigator.of(context).pushNamed(Category1.tag);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DropdownScreen(),
          )
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.cyan[500],
        child: Text('Log In', style: TextStyle(color: Colors.white,fontSize: 20)),
      ),
    );

       final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          // Navigator.of(context).pushNamed(HomePage.tag);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange[300],
        child: Text('Create a New Account', style: TextStyle(color: Colors.white, fontSize: 20))
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            signUpButton
          ],
        )
      ),
    );
  }
}