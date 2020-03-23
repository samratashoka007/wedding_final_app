import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:wedding_final_app/palnnerscreen/adduserdata.dart';
import 'package:wedding_final_app/model/user.dart';
import 'package:wedding_final_app/utils/CardItem.dart';
import 'package:wedding_final_app/utils/FunctinsData.dart';
import 'package:wedding_final_app/utils/Utils.dart';

import '../app.dart';

class PlannerHomeScreen extends StatefulWidget{
  var _titles;
  var _images;

  PlannerHomeScreen(this._titles, this._images);

  @override
  PlannerScreen createState() => PlannerScreen(_titles,_images);
}

class PlannerScreen extends State<PlannerHomeScreen>
{
  bool isTapped;
  int currentSelectedIndex;
  var _titles;
  var _images;
  String _rule;
  String _email;
  String _password;

  PlannerScreen
      (this._titles, this._images);

  @override
void initState() {
    // TODO: implement initState
    super.initState();
    isTapped = false;
    Utils.getStringValue('email').then((value) {
      _email = value;
    });
    Utils.getStringValue('password').then((value) {
      _password = value;
    });
    Utils.getStringValue('role').then((value){
      _rule = value;
    });
  /*  Utils.getStringValue('id').then((value){
      _id = value;
    });
    Utils.getIntValue('locale').then((value) {
      setState(() {
        rtlValue = value;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
           appBar: AppBar(

                title: Text(" Wedding Planner"),
                //leading: Icon(Icons.menu),
                 backgroundColor: Colors.pinkAccent,
                  actions: <Widget>[
                    new IconButton(

                        icon: new Icon(Icons.power_settings_new),
                        onPressed: () {
                          Utils.clearAllValue();
                          Navigator.of(context).pushAndRemoveUntil(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) => new App()),
                                  (Route<dynamic> route) => false);
                        }
                        ),

                  ],
              ),
          body: GridView.builder(
            itemCount:  _titles.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index) {
              return CustomWidget(
                index: index,
                isSelected: currentSelectedIndex == index,
                onSelect: () {
                  setState(() {
                    currentSelectedIndex = index;
                  AppFunction.getPlanner(context, _titles[index]);
                  });
                },
                headline: _titles[index],
                icon: _images[index],
              );
            },
          ),
             /* floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                tooltip: 'Add Data',
                onPressed: () =>
                {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUserData()),)

                }
              ),*/
            ),
            );
  }

}