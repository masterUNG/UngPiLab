import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_pilab/screens/authen.dart';
import 'package:ung_pilab/screens/my_service.dart';
import 'package:ung_pilab/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 120.0;
  double myH1 = 36.0;
  Color myColor = Colors.orange[900];

  // Method

  @override
  void initState() { 
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus()async{

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    if (firebaseUser != null) {
      
      var serviceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);

    }

  }

  Widget signUpButton() {
    return Container(
      width: 200.0,
      child: OutlineButton(
        borderSide: BorderSide(color: myColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: myColor),
        ),
        onPressed: () {
          var registerRoute = MaterialPageRoute(builder: (BuildContext context) => Register());
          Navigator.of(context).push(registerRoute);
        },
      ),
    );
  }

  Widget signInButton() {
    return Container(
      width: 200.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: myColor,
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print('You Click SingIn');

          var authenRoute =
              MaterialPageRoute(builder: (BuildContext context) => Authen());
          Navigator.of(context).push(authenRoute);
        },
      ),
    );
  }

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
          fontWeight: FontWeight.bold,
          fontFamily: 'Lacquer'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            showAppName(),
            signInButton(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
