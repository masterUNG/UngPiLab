import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 120.0;
  double myH1 = 36.0;

  // Method
  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: myWidth,
        height: myWidth,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung PiLab',
      style: TextStyle(
        fontSize: myH1,
        color: Colors.pink[700],
        fontWeight: FontWeight.bold,fontFamily: 'Lacquer'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showLogo(),
          showAppName(),
        ],
      ),
    );
  }
}
