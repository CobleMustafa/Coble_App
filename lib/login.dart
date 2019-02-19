/* This class renders the Login of the Coble App,
* Structurally, this code describes the elements rendered on the page (appBAr, buttons, etc...)
* followed by code on how these elements are presented with each other*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password, _errorMessage;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {

    Future<void> signIn() async {
      if(_formKey.currentState.validate()){
        _formKey.currentState.save();
        setState(() {
          _errorMessage = "";
        });
        try {
          await _auth
              .signInWithEmailAndPassword(email: _email, password: _password);
          _formKey.currentState.reset();
          Navigator.of(context).pushNamed('/toDash');
        } catch (e) {
          print('Error: $e');
          setState(() {
            _errorMessage = e.message;
          });
        }
      }
    }
    final logo = Container( //Logo on the Center of the page
      child: Image(
        image: AssetImage('assets/coble_logo.png'),
        width: 300.0,
        height: 200.0,
      ),
    )
    ;

    final email = TextFormField( //Email Input field
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (input){
        if(input.isEmpty) {
          return 'Please enter your email';
        }
      },
      onSaved: (input) => _email = input.trim(),
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final password = TextFormField( //Password Input Field
      autofocus: false,
      obscureText: true,
      validator: (input) {
        if (input.isEmpty) {
          return 'Please enter your password';
        }
      },
      onSaved: (input) => _password = input,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final loginButton = FloatingActionButton( //Button to go Dashboard Page
          child: Icon(
            Icons.arrow_forward_ios,
            size: 30.0,
          ) ,
          backgroundColor: Color(0xFF4D74E2),
          onPressed: signIn,
    );

    _message() {
      if (_errorMessage != null) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
          child: Text(
              _errorMessage,
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.red,
                height: 1.0,
              )
          ),
        );
      } else {
        return Container(
          height: 0.0,
        );
      }
    }

    final forgotLabel = FlatButton( //Button to go Password Reset Page
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Color(0xFF4D74E2)),
      ),
      onPressed: () {},
    );

    final bottom = BottomAppBar(
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(          //Button to go to Register PAge
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Create an account",
              style: TextStyle(fontSize: 20.0, color: Color(0xFF4D74E2)),
            ),
            onPressed: () {
              _formKey.currentState.reset();
              Navigator.of(context).pushNamed('/toRegister');
            },
          ),
        ],
      ),
    );

    return Scaffold( //Rendition of the page layout
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(35.0, 65.0, 35.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                logo,
                SizedBox(height: 20.0),
                _message(),
                Form(key: _formKey,
                  child: Column(
                    children: <Widget>[
                      email,
                      SizedBox(height: 8.0),
                      password,
                      SizedBox(height: 24.0),
                      loginButton,
                    ],
                  ),
                ),
                SizedBox(height: 18.0),
                forgotLabel,
              ],
            ),
          ),
        ),
        ),
      bottomNavigationBar: bottom,
    );
  }
}
