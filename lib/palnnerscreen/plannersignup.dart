import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_final_app/bloc/Urlconnection.dart';

import 'package:wedding_final_app/bloc/bloc.dart';
import 'package:wedding_final_app/screens/login.dart';
import 'package:wedding_final_app/screens/signup.dart';
import 'package:http/http.dart' as http;

import '../app.dart';

class PlannerSignup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlannerSignUpScreen();
  }
}

class PlannerSignUpScreen extends State<PlannerSignup>{
  final username1 = new TextEditingController();
  final password1 = new TextEditingController();
  final phoneno1 = new TextEditingController();
  final emailid1 = new TextEditingController();
  bool visible = false ;
  Widget build(context){
    return Scaffold(
      body: new Stack(
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
                                  Navigator.of(context).pop(SignUp);
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
          new  Container(
            margin: EdgeInsets.only(top: 50),
            child:new ListView(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(20.0),
                  child: Form(
                    autovalidate: false,

                    child: Column(

                      children: <Widget>[

                        FirstScreen(),
                        UserForm(),
                        EmailForm(),
                        PasswordForm(),
                        PhoneNoForm(),
                        SubmitButton(),
                        Visibility(
                            visible: visible,
                            child: Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: CircularProgressIndicator()
                            )
                        ),
                        //LoginButton(),
                        //  CreateAccount(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

  }
  Widget FirstScreen(){

    return Container(
      child: Center(

          child:Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
               /* child:  Text('Welcome Planner',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30.0,
                  ),
                ),*/
              ),
              new SizedBox(height: 30.0,),
              Container(
                child:  Image.asset('images/assets/logo.png'),
              ),
            ],
          )
      ),
    );
  }
  Widget EmailForm(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snapshot){
        return TextFormField(
          controller: emailid1,
          onChanged: (newEmail){
            bloc.changedEmail(newEmail);
          },
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Email Id',
            hintText: 'Enter Email Id',
            errorText: snapshot.error,
          ),
        );
      },
    );

  }
  Widget UserForm(){
    return StreamBuilder(
      stream: bloc.username,
      builder: (context,snapshot){
        return TextFormField(
          controller: username1,
          onChanged: (newUserName){
            bloc.changedUsername(newUserName);
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'User Name',
            hintText: 'Enter User Name',
            errorText: snapshot.error,
          ),
        );
      },
    );

  }
  Widget PasswordForm(){

    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
        return TextFormField(
          controller: password1,
          onChanged: bloc.changedPassword,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }
  Widget PhoneNoForm(){

    return StreamBuilder(
      stream: bloc.phoneno,
      builder: (context,snapshot){
        return TextFormField(
          controller: phoneno1,
          onChanged: bloc.changedPhoneno,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: 'Phoneno',
            hintText: 'Enter Phoneno',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }
  Widget SubmitButton(){

    return Container(
      margin: EdgeInsets.all(20.0),
      child: RaisedButton(

        shape: new RoundedRectangleBorder(
            borderRadius:
            new BorderRadius.circular(30.0)),
        color: Colors.pink,
        child: Text('SignUp',
          style: TextStyle(
            color: Colors.white,
          ),),
        elevation: 5.0,
        padding: EdgeInsets.only(
            left: 80.0,
            right: 80.0,
            top: 15.0,
            bottom: 15.0),
        onPressed:(){
         userRegistration();

          /*if(formKey.currentState.validate()){
            formKey.currentState.save();
          }*/
        },
      ),

    );
  }
  Future userRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String name = username1.text;
    String email = emailid1.text;
    String password = password1.text;
    String phoneno=phoneno1.text;

    // SERVER API URL
    var url = UrlCollection.reg_url;

    // Store all data with Param Name.
  var data = {'name': name, 'email': email, 'password' : password,'contact_no':phoneno};


   /* final response = await http.post(

      Uri.encodeFull(url),
      body: {
        "name":name,"email":email,"password":password,"contact_no":phoneno
      },
      *//*headers: {'Content-Type': 'application/json'},*//*

    );*/
    // Starting Web API Call.
    var response = await http.post(url, body: (data));
  //  String jsonsDataString = response.body.toString();
    // Getting Server response into variable.
    var message = json.decode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(title: Text(message),
        actions: <Widget>[
          CupertinoAlertDialog(

            
          )
        ],);



        /* AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
             // Navigator.of(context).pop();
                Fluttertoast.showToast(msg: "Thank u for Registration !!! You need to login",toastLength: Toast.LENGTH_LONG);

                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(

                        builder: (BuildContext context) => new App()),
                        (Route<dynamic> route) => false);
              },
            ),
          ],
        );*/
      },
    );

  }
  _navigator() {
    if (username1.text.length != 0 || password1.text.length != 0 || phoneno1.text.length !=0||emailid1.text.length!=0) {
     // Fluttertoast.showToast(msg: "Thank u for Registration !!! You need to login",toastLength: Toast.LENGTH_LONG);
      userRegistration();
     /* Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(

              builder: (BuildContext context) => new LoginPage()),
              (Route<dynamic> route) => false);*/
    } else {

      showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text("SignUp Error"),
              content: Text("You need to full filled all field"),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text("OK"),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "OK", toastLength: Toast.LENGTH_LONG);
                    Navigator.of(context).pop();
                  },
                ),
                /*  CupertinoDialogAction(
                  child: Text("CANCEL"),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "CANCEL", toastLength: Toast.LENGTH_SHORT);
                    Navigator.of(context).pop();
                  },
                )*/
              ],
            );
          });
    }
  }
}
/*
  Widget LoginButton(){

    return Container(
      margin: EdgeInsets.all(20.0),
      child: RaisedButton(

        shape: new RoundedRectangleBorder(
            borderRadius:
            new BorderRadius.circular(30.0)),
        color: Colors.pink,
        child: Text(stringfile.login,
          style: TextStyle(
            color: Colors.white,
          ),),
        elevation: 5.0,
        padding: EdgeInsets.only(
            left: 80.0,
            right: 80.0,
            top: 15.0,
            bottom: 15.0),
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => App()),
          );
          *//*if(formKey.currentState.validate()){
            formKey.currentState.save();
          }*//*
        },
      ),

    );
  }*/
