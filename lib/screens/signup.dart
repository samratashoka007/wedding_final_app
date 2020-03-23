import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_final_app/palnnerscreen/plannersignup.dart';
import 'package:wedding_final_app/screens/MainLogin.dart';

/*import 'package:planner_flutter_app/plannerscreen/plannersignup.dart';*/

import '../app.dart';



class SignUp extends StatefulWidget{
  createState(){
    return SignUpScreen();
  }
}
class SignUpScreen extends State<SignUp>{
  Widget build(context){
    return Scaffold(


      body: Stack(
        children: <Widget>[

          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: new Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: IconButton(
                                icon: Icon(Icons.arrow_back,
                                  color: Color(0xFF880E4F),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(MainLogin);
                                })),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.0, bottom: 0.0, top: 0.0),
                          child: new Text("SIGN UP",

                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,

                              ),
                              textAlign: TextAlign.left),
                        )
                      ],
                    ),
                  )
                ],
              ),
              /* new SizedBox(
                height: 30.0,
              ),*/
            ],
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(),
              Container(

                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                child: ClipOval(
                  child: Container(
                    color: Colors.amber,
                    height: 200.0,
                    width: 200.0,
                    child: RaisedButton(
                      color: Colors.pinkAccent,
                      child: Text(
                        'I am Planner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> PlannerSignup(),
                            )
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                child: ClipOval(
                  child: Container(

                    height: 200.0,
                    width: 200.0,
                    child: RaisedButton(
                      color: Colors.pinkAccent,
                      child: Text(
                        'I am User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> App(),
                        ));
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),


    );
  }
}