import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:wedding_final_app/utils/CardItem.dart';
import 'package:wedding_final_app/utils/FunctinsData.dart';
import 'package:wedding_final_app/utils/Utils.dart';

import '../app.dart';
import '../main.dart';


//notificatiopn handler



// ignore: must_be_immutable
class Home extends StatefulWidget {
  var _titles;
  var _images;

  Home(this._titles, this._images);

  @override
  _HomeState createState() => _HomeState(_titles, _images);
}

class _HomeState extends State<Home> {
  bool isTapped;
  int currentSelectedIndex;
  int rtlValue;
  String _email;
  String _password;
  String _rule;
  String _id;
  var _titles;
  var _images;


  _HomeState(this._titles, this._images);



  @override
  void initState() {
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
    Utils.getStringValue('id').then((value){
      _id = value;
    });
    Utils.getIntValue('locale').then((value) {
      setState(() {
        rtlValue = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.pink, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBar(
          primary: false,
          centerTitle: false,
          title:Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'images/assets/wedding_logo.jpg',
                  width: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 20.0),
                child: Text("WeddingPlanner")
              ),
              //Text("Wedding Planner"),
              Expanded(child: Container()),

            ],
          ),
          flexibleSpace: Image(
            image: AssetImage('images/assets/tool_bar_bg.png'),
            fit: BoxFit.cover,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child:  new IconButton(

                  icon: new Icon(Icons.power_settings_new),
                  onPressed: () {
                    Utils.clearAllValue();
                    showAlertDialog1(context);
                  /*  Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new App()),
                            (Route<dynamic> route) => false);*/
                  }
              ),
            ),


          ],
          elevation: 0.0,
        ),
        body: GridView.builder(
          itemCount: _titles.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return CustomWidget(
              index: index,
              isSelected: currentSelectedIndex == index,
              onSelect: () {
                setState(() {
                  currentSelectedIndex = index;
                  if(_rule == '2'){
                    AppFunction.getUser(context, _titles[index]);
                  }
                 /* else if(_rule == '4'){
                    AppFunction.getTeacherDashboardPage(context, _titles[index]);
                  }*/
                  else if(_rule == '3'){
                    AppFunction.getGuest(context, _titles[index]);
                  }
                  else if(_rule == '1'){
                    AppFunction.getPlanner(context, _titles[index]);
                  }
                });
              },
              headline: _titles[index],
              icon: _images[index],
            );
          },
        ),
      ),
    );
  }

  showAlertDialog1(BuildContext context){
    Widget cancel = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButtn = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Utils.clearAllValue();
//        Utils.saveBooleanValue('isLogged', false);
        Utils.saveIntValue('locale', rtlValue);
        Route route = MaterialPageRoute(builder: (context) => MyApp());
        Navigator.pushAndRemoveUntil(context, route,ModalRoute.withName('/'));
      },
    );


    CupertinoAlertDialog cupertinoAlertDialog=CupertinoAlertDialog(
      title: Text("Logout"),
      content: Text("would you like to logout ? "),
      actions: <Widget>[
        cancel,
        yesButtn,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return cupertinoAlertDialog;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Utils.clearAllValue();
//        Utils.saveBooleanValue('isLogged', false);
        Utils.saveIntValue('locale', rtlValue);
        Route route = MaterialPageRoute(builder: (context) => MyApp());
        Navigator.pushAndRemoveUntil(context, route,ModalRoute.withName('/'));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: Theme.of(context).textTheme.headline,
      ),
      content: Text("Would you like to logout?"),
      actions: [
        cancelButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showStudentProfileDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                      //color: const Color(0xFF66BB6A),
                      boxShadow: [BoxShadow(
                        color: Colors.pinkAccent,
                        blurRadius: 20.0,
                      ),]
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0,right: 15.0),
                      child: ListView(
                        children: <Widget>[
                        /*  GestureDetector(
                            child: Text(
                              "Profile",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: () {
                              Navigator.push(context, ScaleRoute(page: Profile()));
                            },
                          ),*/
                        /*  Text(
                            "Change Password",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.headline,
                          ),*/
                          GestureDetector(
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: (){
                              showAlertDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  showOhtersProfileDialog(BuildContext context) {
    showDialog<void>(

      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                      //color: const Color(0xFF66BB6A),
                      boxShadow: [BoxShadow(
                        color: Colors.pink.shade300,
                        blurRadius: 20.0,
                      ),]
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0,right: 15.0),
                      child: ListView(
                        children: <Widget>[
                          Text(
                            "Change Password",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.headline,
                          ),
                          SizedBox(height: 10.0,),
                          GestureDetector(
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: (){
                              showAlertDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }


 /* Widget getProfileImage(
      BuildContext context, String email, String password, String rule) {
    return FutureBuilder(
      future: getImageUrl(email, password, rule),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          Utils.saveStringValue('image', snapshot.data);
          return GestureDetector(
            onTap: () {
              rule == '2' ? showStudentProfileDialog(context) : showOhtersProfileDialog(context);
            },
            child: Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: CircleAvatar(
                  radius: 22.0,
                  backgroundImage: NetworkImage(snapshot.data),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              rule == '2' ? showStudentProfileDialog(context) : showOhtersProfileDialog(context);
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
          );
        }
      },
    );
  }*/

/*
  Future<String> getImageUrl(String email, String password, String rule) async {
    var image = 'https://i.imgur.com/BoN9kdC.png';

    var response = await http.get(InfixApi.login(email, password));

    if (response.statusCode == 200) {
      Map<String, dynamic> user = jsonDecode(response.body) as Map;
      if (rule == '2')
        image = InfixApi.root + user['data']['userDetails']['student_photo'];
      else if (rule == '3')
        image = InfixApi.root + user['data']['userDetails']['fathers_photo'];
      else
        image = InfixApi.root + user['data']['userDetails']['staff_photo'];
    }
    return '$image';
  }
*/

  void navigateToPreviousPage(BuildContext context) {
    Navigator.pop(context);
  }
/*  void sendTokenToServer(String token) async{
    final response = await http.get(InfixApi.setToken(_id,token));
    if (response.statusCode == 200) {
      print('token updated : $token');
    } else {
      throw Exception('Failed to load');
    }
  }*/

/*  static Future<void> _showNotification(String title,String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'infixEdu', 'infix', 'this channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, '$title', '$body', platformChannelSpecifics,
        payload: 'infixEdu');
  }*/
}

