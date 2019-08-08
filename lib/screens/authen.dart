import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_pilab/screens/my_service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String emailString = '', passwordString = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Method
  Widget emailText() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 200.0,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: 'Email'),
          onSaved: (String value) {
            emailString = value;
          },
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 200.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password'),
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> rouet) => false);
    }).catchError((response) {
      String errorString = response.message;
      mySnackBar(errorString);
    });
  }

  void mySnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Authen'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            emailText(),
            passwordText(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          formKey.currentState.save();
          print('email = $emailString, password = $passwordString');
          checkAuthen();
        },
      ),
    );
  }
}
