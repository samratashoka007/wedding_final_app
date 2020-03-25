import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_final_app/screens/MainLogin.dart';
import 'package:wedding_final_app/screens/homescreen.dart';
import 'package:wedding_final_app/screens/login.dart';
import 'package:wedding_final_app/utils/Utils.dart';

import '../utils/FunctinsData.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}
class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);

   // return new Timer(_duration, navigationPage);
  }

  /*void navigationPage() {
    //Navigator.of(context).pushReplacementNamed('/App');
  }*/

  @override
  void initState() {
    super.initState();
  //  startTime();
    Route route;

    Future.delayed(Duration(seconds: 3), () {
      getBooleanValue('logged_in').then((value) {
        if (value) {
//        route = MaterialPageRoute(builder: (context) => Home());
          Utils.getStringValue('role').then((rule) {
            AppFunction.getFunctions(context, rule);
          });
        } else {
          route = MaterialPageRoute(builder: (context) => MainLogin());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('images/assets/splashscreen.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: new Container(
                decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset('images/assets/logo.png'),
            ],
          ),
        ],
      ),
    );


  }
  Future<bool> getBooleanValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }


}