import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de cafeína",
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _caffess = 0;
  int _caffeine = 0;
  String _alert = "";

  void changeCoffee(int delta){
      setState(() {
        _caffess += delta;
        _caffeine = _caffess * 80; 

        _alert = "";
        if(_caffeine > 400){
          this._alert = "Cuidado! Você pode ficar muito ansioso!";
        }else if(_caffeine < 0){
          this._alert = "Uééé´!";
        }

      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.local_cafe,
            color: Colors.brown,
            size: 90.0,
          ),
          Text("Cafeína ingerida", style: TextStyle(decoration: TextDecoration.none, color: Colors.brown, fontSize: 25.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  changeCoffee(1);
                },
                child: Text("+", style: TextStyle(fontSize: 40.0, color: Colors.brown)),
              ),
              Text("$_caffess", style: TextStyle(decoration: TextDecoration.none, color: Colors.brown, fontSize: 30.0)),
              FlatButton(
                onPressed: () {
                  changeCoffee(-1);
                },
                child: Text("-", style: TextStyle(fontSize: 40.0, color: Colors.brown)),
              ),
            ],
          ),
          this._alert.isEmpty ? Text("$_caffeine mg", style: TextStyle(decoration: TextDecoration.none, color: Colors.grey, fontStyle: 
          FontStyle.italic, fontSize: 12.0)) :Text(this._alert, style: TextStyle(decoration: TextDecoration.none, 
          color: Colors.red, fontStyle: FontStyle.italic, fontSize: 12)),
        ],
      )
    );
  }
}
