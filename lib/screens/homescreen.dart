import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding_final_app/guestroutes/event1.dart';

import 'package:wedding_final_app/guestroutes/events.dart';
import 'package:wedding_final_app/guestroutes/guesthomelayout.dart';
import 'package:wedding_final_app/guestroutes/guestinvitationlayout.dart';
import 'package:wedding_final_app/utils/Utils.dart';

import '../app.dart';




class HomeScreen extends StatefulWidget {

  var _titles;
  var _images;

  HomeScreen(this._titles, this._images);

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.power_settings_new),
                onPressed: () {
                  Utils.clearAllValue();
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new App()),
                          (Route<dynamic> route) => false);
                }),
          ],
          title: Text("Wedding App"),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  "HELLO ANDY!!",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Colors.pinkAccent),
              ),
              ListTile(
               leading: IconButton(
                 icon: Icon(Icons.event,color: Colors.pinkAccent),
                onPressed: (){
                   Navigator.pop(context);
                },
               ),
                title: Text("Event"),

                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Events()));
                },
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.wc,color: Colors.pinkAccent),
                  onPressed: (){

                  },
                ),
                title: Text("Relatives"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Events()));
                },
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.info,color: Colors.pinkAccent),
                  onPressed: (){

                  },
                ),
                title: Text("AboutUs"),
                onTap: () {
                  Navigator.pop(context);
                 /* Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Events()));*/
                },
              )
            ],
          ),
        ),
        body: new DefaultTabController(
          length: 2,
          child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: [
                  new Tab(text: "Wedding",),
                  new Tab(text: "Invitation",),
                 // new Tab(icon: new Icon(Icons.directions_bike)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: new TabBarView(
              children: [
                GuestHomeLayout(),
                GuestInviattaionLayout(),
               // new Icon(Icons.directions_bike,size: 50.0,),
              ],
            ),
          ),
        ));
  }
}