import 'package:flutter/material.dart';
import 'package:hello_world/homepage.dart';


void main() {
  //Widget
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //nova instância. Três propriedades
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //Cor do tema
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }

}