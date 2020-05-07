import 'package:flutter/material.dart';
// import 'dart:async';
import 'dart:math';

// Esta classe não é usada no projeto, está aqui para referencias futuras

void main() => runApp(PlayDice());

class PlayDice extends StatefulWidget {

  _PlayDiceState createState() => _PlayDiceState();
}

class _PlayDiceState extends State<PlayDice>{

  // Widget _animatedWidget;
  String _frente;
  String _lado;

  // _PlayDiceState() {

  //   Timer(Duration(seconds: 1), () {
  //     setState(() {
  //       _animatedWidget = _parte2();
  //     });
  //   });

  //   _animatedWidget = _parte1();
  // }

  // _parte1() {

  //   return Container(
  //     decoration: BoxDecoration(
  //         image: DecorationImage(
  //             image: AssetImage("./assets/giphy.gif"), 
  //             fit: BoxFit.cover,
  //         ),
  //     ),
  //   );
  // }

  _parte2() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        _myText("Frente",40,200,100),
        _myImage(_sortNumber("1")),

        _myText("Lado",40,200,100),
        _myImage(_sortNumber("2")),         

        Container(
          margin: EdgeInsets.fromLTRB(100, 50, 100, 0),
          height: 100,
          width: 200,
          // padding: EdgeInsets.fromLTRB(100, 50, 100, 50),
          child: RaisedButton(
            padding: EdgeInsets.all(10),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            color: Colors.black,
            onPressed: () {Navigator.pop(context, _frente + "," +_lado);},
            child: _myText('OK',60,100,100),
          ),
        ),
      ],
    );
  }

  _myText(String value, double size, double width, double height) {

    return Container(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(value,
            style: TextStyle(
            inherit: true,
            fontSize: size,
            color: size == 60 ? Colors.white : Colors.black,
            shadows: [
              Shadow( // topRight
                offset: Offset(1.5, 1.5),
                color: Colors.grey,
              ),
            ],
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  _myImage(int value) {

    if (value == 1) return Image.asset("./assets/1.png", width: 100, height: 100,);
    if (value == 2) return Image.asset("./assets/2.png", width: 100, height: 100,);
    if (value == 3) return Image.asset("./assets/3.png", width: 100, height: 100,);
    if (value == 4) return Image.asset("./assets/4.png", width: 100, height: 100,);
    if (value == 5) return Image.asset("./assets/5.png", width: 100, height: 100,);
    if (value == 6) return Image.asset("./assets/6.png", width: 100, height: 100,);
  }

  _sortNumber(String value) {

    var _rnd = Random();
    int result = (_rnd.nextInt(6) + 1);
    if (value == "1") _frente = result.toString();
    if (value == "2") _lado = result.toString();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: null,
          body: Center (
            child: _parte2(),
          ),
    );
  }
}