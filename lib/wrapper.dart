import 'package:duelingo_flashcard/authenticate/authenticate.dart';
import 'package:duelingo_flashcard/home/home.dart';
import 'package:flutter/material.dart';


class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) { 

    //return either Home or Category1 widget
    return Authenticate();
  }
}