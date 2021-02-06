import 'package:flutter/material.dart';
import 'HomePage.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe Game",
      theme: new ThemeData(

        primarySwatch: Colors.yellow,
      ),

      home: HomePage(),
      
    );
  }
}



