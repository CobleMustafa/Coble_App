/*This is the main class of the Coble App, This app connects IoS and Android mobiles
to Coble devices.
*/
import 'package:flutter/material.dart';

//Classes part of the Coble App
import './dashboard.dart';
import 'login.dart';
import 'register.dart';


main() {
  runApp(MaterialApp(
    home: LoginPage(),        //Initial Page of the App
    routes: <String, WidgetBuilder> { //List of navigation routes within the app
      '/toDash': (BuildContext context) => DashBoardPage(),
      '/toRegister': (BuildContext context) => RegisterPage(),
      'toLogin': (BuildContext context) => LoginPage(),
    },
  ));
}


