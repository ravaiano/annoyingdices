import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
//import 'playdice.dart';
import 'dart:math';

int x = 1;
int _novaPos2 = 0;
int _novaPos4 = 0;
int _novaPos6 = 0;
int _novaPos8 = 0;
int _resultado = 0;
String _altDirEsq = "E";
String obstacleColumn = _sortField();
String frontalLimit = "145,146,147,148,149,150,151,152,153,154";
String rightLimits = "10,19,28,37,46,55,64,73,82,91,100,109,118,127,136";
String leftLimits = "18,27,36,45,54,63,72,81,90,99,108,117,126,135,144";
String _ganhador;
bool _start = true;
String _frente;
String _lado;

_sortField() {
    var _rnd = Random();
    int result = (_rnd.nextInt(6) + 1);
    if (result == 1) return "1,3,5,7,9,28,29,30,44,45,55,56,57,58,59,80,81,76,85,94,121,122,123";
    if (result == 2) return "1,3,5,7,9,39,40,41,42,65,74,83,70,79,88,97,109,110,111,132,133";
    if (result == 3) return "1,3,5,7,9,30,39,48,57,58,59,60,69,78,87,96,109,110,111,112,134,135";
    if (result == 4) return "1,3,5,7,9,28,29,30,31,60,61,62,63,82,83,84,85,86,113,114,115,116,117,127";
    if (result == 5) return "1,3,5,7,9,31,32,56,57,58,59,60,61,91,92,93,97,98,99,122,130,132";
    if (result == 6) return "1,3,5,7,9,21,41,53,65,78,93,116,127,128,134,135";
}

void main() => runApp(MyApp());
	
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Rav Games',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Paulo Ravaiano Games'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(); 
}

class _MyHomePageState extends State<MyHomePage> {

  String _gamer1 = "T";
  String _gamer2 = "F";
  String _gamer3 = "D";
  String _gamer4 = "D";
  int _totGamers = 2;
  int _atualGamer = 1;
  String _caminho = "";

  ScrollController _controller = ScrollController();

  _inicio() {
    setState(() {
      obstacleColumn = _sortField();
      x = 1;
      _altDirEsq = "E";
      _caminho = "";
      _novaPos2 = 2;
      _novaPos4 = 4;
      _novaPos6 = 0;
      _novaPos8 = 0;
      _gamer1 = "T";
      _gamer2 = "F";
      _gamer3 = "D";
      _gamer4 = "D";
      _atualGamer = 1;
      _totGamers = 2;
      _controller.jumpTo(_controller.position.minScrollExtent);
    });
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SimpleDialog (
      contentPadding: EdgeInsets.zero,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Quantos jogadores:',
                    style: TextStyle(
                    inherit: true,
                    fontSize: 40,
                    color: Colors.blue,
                    shadows: [
                        Shadow( // topRight
                          offset: Offset(1.5, 1.5),
                          color: Colors.blue[50],
                        ),
                      ],
                    ),
                  ),
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: (){setState(() {
                _novaPos2 = 2;
                _novaPos4 = 4;
                _novaPos6 = 0;
                _novaPos8 = 0;
                _gamer1 = "T";
                _gamer2 = "F";
                _gamer3 = "D";
                _gamer4 = "D";
                _totGamers = 2;
              });},
              child: Text("2", style: TextStyle(color: Colors.white),),
            ),
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: (){setState(() {
                _novaPos2 = 2;
                _novaPos4 = 4;
                _novaPos6 = 6;
                _novaPos8 = 0;
                _gamer1 = "T";
                _gamer2 = "F";
                _gamer3 = "F";
                _gamer4 = "D";
                _totGamers = 3;
              });},
              child: Text("3", style: TextStyle(color: Colors.white),),
            ),
          ),
        Padding(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: (){setState(() {
                _novaPos2 = 2;
                _novaPos4 = 4;
                _novaPos6 = 6;
                _novaPos8 = 8;
                _gamer1 = "T";
                _gamer2 = "F";
                _gamer3 = "F";
                _gamer4 = "F";
                _totGamers = 4;
              });},
              child: Text("4", style: TextStyle(color: Colors.white),),
            ),
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              color: Colors.blue,
              child: Icon(Icons.check, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
                setState(() {
                  _novaPos2 == 0 ? _start = true : _start = false;
                });
              },
            ),
        ),
      ],
    ),
    );
  }

  _avatars(String numCol) {
      if (numCol == _novaPos2.toString()) return Image.asset("./assets/av1.png", width: 100, height: 100,);
      if (numCol == _novaPos4.toString()) return Image.asset("./assets/av2.png", width: 100, height: 100,);
      if (numCol == _novaPos6.toString()) return Image.asset("./assets/av3.png", width: 100, height: 100,);
      if (numCol == _novaPos8.toString()) return Image.asset("./assets/av4.png", width: 100, height: 100,);
      if (numCol == "136") return Icon(IcoFontIcons.racingFlagAlt);
      return null;
  }

  _fieldDesign(String numCol) {
    List<String> lista = obstacleColumn.split(',');
    List<String> caminho = _caminho.split(',');
    
    Color _color = Colors.blue[50];

    lista.forEach((i) {
      if (numCol == i) {
        _color = Colors.blue[200];
      }
    });

    caminho.forEach((i) {
      if (numCol == i) {
        _color = Colors.blue[100];
      }
    });

    if (numCol == "136") {
      _color = Colors.orange[200];
    }

    return _color;
  }

  _column(String myKey) {
    return Column(
      children: <Widget>[
        Container(
          key: Key(myKey),
          child: _avatars(myKey),
          margin: EdgeInsets.fromLTRB(4, 2, 2, 2),
          height: 100,
          width: 100,
          decoration:
              BoxDecoration(
                  color: _fieldDesign(myKey),
                  border: Border.all(
                    color: Colors.blue[100],
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
        ),
      ],
    );
  }

  _row() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for(int i = 0; i < 9; i++) _column((x++).toString()),
          ],
        ),
      ),
    );
  }

  _drawBoard() {
    x = 1;
    return Container(
      child:ListView.builder(
        controller: _controller,
              itemCount: 16,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return _row();
              }
            ),
    );
  }

  _playDice() async {
    _controller.jumpTo(_controller.position.minScrollExtent);

    if (_gamer1 == 'T') {
        _ganhador = "./assets/av1.png";
      } else if (_gamer2 == 'T') {
        _ganhador = "./assets/av2.png";
      } else if (_gamer3 == 'T') {
        _ganhador = "./assets/av3.png";
      } else if (_gamer4 == 'T') {
        _ganhador = "./assets/av4.png";
      }

    final result = await  _resultPlayDice(_ganhador, _altDirEsq);
    
    int _frente = 0; 
    int _lado = 0;

    int _np = 0;

    List<String> lista = result.split(",");
    List<String> _obst = obstacleColumn.split(',');
    List<String> _left = leftLimits.split(',');
    List<String> _right = rightLimits.split(',');
    List<String> _front = frontalLimit.split(',');

    _frente = int.parse(lista[0]);
    _lado = int.parse(lista[1]);
    _caminho = "";
    
    if (_gamer1 == 'T') {
      _np = _novaPos2 + 9;
    }
    if (_gamer2 == 'T') {
      _np = _novaPos4 + 9;
    }
    if (_gamer3 == 'T') {
      _np = _novaPos6 + 9;
    }
    if (_gamer4 == 'T') {
      _np = _novaPos8 + 9;
    }

    for (var i = 0; i < _frente; i++) { 
      if (_front.contains(_np.toString())) {
        break;
      }        
      if (!_obst.contains(_np.toString())) {
        _np = _np + 9;
        _caminho = _caminho + (_np - 9).toString() + ',';
      } else break;
    } 

    _resultado = _np - 9;

    if (_resultado != 136) {
      if (_altDirEsq == 'E' && !_left.contains(_resultado.toString())) {
        _np = _resultado + 1;

        for (var i = 0; i < _lado; i++) {     
          if (_obst.contains(_np.toString())) {
            break;
          } 
          if (_front.contains(_np.toString())) {
            break;
          } 
          if (_left.contains(_np.toString())) {
            _np = _np + 1;
            _caminho = _caminho + (_np - 1).toString() + ',';
            break;
          }       
          if (!_obst.contains(_np.toString())) {
              _np = _np + 1;
              _caminho = _caminho + (_np - 1).toString() + ',';
          }
        }
        _resultado = _np - 1;
      } else if (_altDirEsq == 'D' && !_right.contains(_resultado.toString())) {
        _np = _resultado - 1;

        for (var i = 0; i < _lado; i++) {  
          if (_obst.contains(_np.toString())) {
            break;
          } 
          if (_front.contains(_np.toString())) {
            break;
          } 
          if (_right.contains(_np.toString())) {
            _np = _np - 1;
            _caminho = _caminho + (_np + 1).toString() + ',';
            break;
          }        
          if (!_obst.contains(_np.toString())) {
              _np = _np - 1;
              _caminho = _caminho + (_np + 1).toString() + ',';
          }
        }
        _resultado = _np + 1; 
      }
    }

    _atualGamer++;
    if (_atualGamer > _totGamers) {
      _atualGamer = 1;
      if (_altDirEsq == 'E') {_altDirEsq = 'D';} else {_altDirEsq = 'E';}
    }

    setState(() {
      if (_gamer1 == 'T') {
        _novaPos2 = _resultado;
        _ganhador = "./assets/av1.png";
        _gamer1 = "F";
        _gamer2 = "T";
      } else if (_gamer2 == 'T') {
        _novaPos4 = _resultado;
        _ganhador = "./assets/av2.png";
        _gamer2 = "F";
        _gamer3 != "D" ?_gamer3 = "T" : _gamer4 != "D" ?_gamer4 = "T" : _gamer1 = "T";
      } else if (_gamer3 == 'T') {
        _novaPos6 = _resultado;
        _ganhador = "./assets/av3.png";
        _gamer3 = "F";
        _gamer4 != "D" ?_gamer4 = "T" : _gamer1 = "T";
      } else if (_gamer4 == 'T') {
        _novaPos8 = _resultado;
        _ganhador = "./assets/av4.png";
        _gamer4 = "F";
        _gamer1 = "T";
      }      
    });

    if (_resultado > 91) {
      setState(() {
       _controller.jumpTo(_controller.position.maxScrollExtent); 
      });
    }

    if (_resultado == 136) {
      setState(() {        
        _controller.jumpTo(_controller.position.maxScrollExtent);
        Timer(Duration(milliseconds: 1000), () =>_fim(_ganhador));
      });
    }
  }

   _resultPlayDice(String gamer, String direcao) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SimpleDialog (
        backgroundColor: Colors.white.withOpacity(.50),
        contentPadding: EdgeInsets.zero,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget> [
                      Image.asset(gamer, width: 100, height: 100,),
                      direcao == "E" ? Image.asset("./assets/esquerda.png", width: 50, height: 50,) : Image.asset("./assets/direita.png", width: 50, height: 50,),
                    ]  
                  ),
                ),

                _myText("Frente",40,200,100),
                _myImage(_sortNumber("1")),

                _myText("Lado",40,200,100),
                _myImage(_sortNumber("2")),         

                Container(
                  margin: EdgeInsets.fromLTRB(100, 50, 100, 20),
                  height: 100,
                  width: 200,
                  child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    color: Colors.blue,
                    onPressed: () {Navigator.pop(context, _frente + "," +_lado);},
                    child: _myText('OK',60,100,100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
            color: size == 60 ? Colors.white : Colors.blue,
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

  _fim(String value) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SimpleDialog (
      contentPadding: EdgeInsets.zero,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text('Parabéns !!',
                    style: TextStyle(
                    inherit: true,
                    fontSize: 40,
                    color: Colors.blue,
                    shadows: [
                        Shadow( // topRight
                          offset: Offset(1.5, 1.5),
                          color: Colors.blue[50],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
        Container(
            padding: EdgeInsets.all(20),
            child: Image.asset(value, width: 100, height: 100,),
        ),
        Container(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              color: Colors.blue,
              child: Icon(Icons.check, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
                setState(() {
                  _inicio();
                });
              },
            ),
        ),
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _drawBoard(),
      floatingActionButton: FloatingActionButton(
        child: Icon(IcoFontIcons.diceMultiple), 
        onPressed: () {_start ? _inicio() : _playDice();}
      ),
    );
  }
}