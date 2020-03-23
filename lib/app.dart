import 'package:flutter/material.dart';
import 'package:wedding_final_app/screens/MainLogin.dart';

import 'screens/login.dart';


class App extends StatelessWidget{
  @override
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wedding App',
      theme: ThemeData(
        //primarySwatch: Colors.redAccent,
        primaryColor: Colors.pinkAccent,
      ),
      home: Scaffold(


        appBar: AppBar(
          title: Text('Wedding App',),

        ),
        body: MainLogin(),
      ),
    );
  }

}