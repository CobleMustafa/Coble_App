import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterState();
  }
}

class _RegisterState extends State<RegisterPage>{
  String _email, _password, _errorMessage;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void signUp() async {
      if(_formKey.currentState.validate()){
        _formKey.currentState.save();
        setState(() {
          _errorMessage = "";
        });
        try {
          await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
          Navigator.of(context).pushNamed('/toDash');
        } catch (e) {
          print('Error: $e');
          setState(() {
            _errorMessage = e.message;
          });
        }
      }
    }
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/registration.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (input) {
        if (input.isEmpty) {
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

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (input) {
        if (input.length < 6) {
          return 'Your password is too short';
        }
      },
      onSaved: (input) => _password = input,
      decoration: InputDecoration(
        labelText: 'Password (Min. 6 characters)',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final button = RaisedButton(
      child: Text('Submit',
      style: TextStyle(fontSize: 20.0),),
      textColor: Colors.white,
      elevation: 2.0,
      color: Color(0xFF4D74E2),
      onPressed: signUp,
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

    final bottom = BottomAppBar(
      elevation: 0.0,
      color: Colors.white10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20.0, color: Color(0xFF4D74E2)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 195.0,),
          Container(
            width: 115.0,
            height: 65.0,
            child: Image.asset('assets/coble_logo.png'),
          )
        ],
      ),
    );


    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(35.0, 70.0, 35.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                logo,
                SizedBox(height: 30.0),
                _message(),
                Form(key: _formKey,
                  child: Column(
                    children: <Widget>[
                      email,
                      SizedBox(height: 16.0),
                      password,
                      SizedBox(height: 16.0),
                      SizedBox(height: 18.0),
                      button,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),),
      bottomNavigationBar: bottom,
    );
  }
}

