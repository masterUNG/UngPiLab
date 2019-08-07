import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit

  // Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: Colors.green,
        ),
        labelText: 'Name :',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'Type Your Name',helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'English only',
      ),
    );
  }

  Widget emailText() {
    return TextFormField(keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.blue,
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(color: Colors.blue),
        helperText: 'Type Your Email',helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'you@email.com',
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.red,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.red),
        helperText: 'Type Your Password',helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'More 6 Charactor',
      ),
    );
  }

  Widget groupText() {
    return ListView(
      padding: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
      children: <Widget>[
        nameText(),
        emailText(),
        passwordText(),
      ],
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'Register Firebase',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[registerButton()],
        backgroundColor: Color.fromARGB(255, 255, 111, 0),
        title: Text('Register'),
      ),
      body: groupText(),
    );
  }
}
