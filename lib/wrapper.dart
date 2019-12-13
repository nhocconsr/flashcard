import 'package:duelingo_flashcard/authenticate/authenticate.dart';
import 'package:duelingo_flashcard/category1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/user.dart';
import './category2.dart';


class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) { 


   final user = Provider.of<User>(context);
   print(user);


    //return either Home or Category1 widget
    if(user == null){
      return Authenticate();
    } else {
      return Authenticate(); // need to change the scroll page
    }
  }
}