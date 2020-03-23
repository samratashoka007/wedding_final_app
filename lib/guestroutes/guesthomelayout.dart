
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app.dart';
String _email='';
class GuestHomeLayout extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GuestLayout();
  }
}
class GuestLayout extends State<GuestHomeLayout>{

  @override
  void initState() {
    super.initState();
    _loadCounter();

  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('username') ?? '');
    });
  }
  Widget build(context){
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image.asset(
              'images/assets/splashscreen.jpg',
              fit: BoxFit.cover,),
          ),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0
                ),
                child: Scaffold(
                  backgroundColor: Colors.black12,
                  body: Container(),
                ),
              )
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Container(
                  width: 300.0,
                  height: 300.0,
                  decoration:BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: new AssetImage('images/assets/logo.png'),
                    ),
                  ),
                ),
              ],
            ),

          ),
          Positioned(

            bottom: 58.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "About Wedding",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Text(
                    "Welcome on Wedding..."+_email,
                    style: new TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}