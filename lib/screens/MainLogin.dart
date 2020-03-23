import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_final_app/bloc/Urlconnection.dart';
import 'package:wedding_final_app/bloc/bloc.dart';
import 'package:wedding_final_app/utils/Utils.dart';
import 'package:http/http.dart'as http;

import 'login.dart';

class MainLogin extends StatefulWidget{
@override

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreen();
  }
}

class LoginScreen extends State<MainLogin>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String user;
  String email;
  Future<String> futureEmail;
  String password = '123456';
  bool isResponse = false;


  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/assets/splashscreen.jpg'),
                          fit: BoxFit.cover,
                        )
                    ),

                    child: Center(
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/assets/logo.png'),
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView(
                      children: <Widget>[
                      /*  Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                //  user = 'planner';
                                  //futureEmail = getEmail(user);
                                  futureEmail.then((value){
                                    setState(() {
                                      email = value;
                                      emailController.text = email;
                                      passwordController.text = password;
                                    });
                                  });
                                },
                                color: Colors.purpleAccent,
                                textColor: Colors.white,
                                child: Text("Planner",style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),),
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                   // user = 'user';
                                    //futureEmail = getEmail(user);
                                    futureEmail.then((value){
                                      setState(() {
                                        email = value;
                                        emailController.text = email;
                                        passwordController.text = password;
                                      });
                                    });
                                  });
                                },
                                color: Colors.purpleAccent,
                                textColor: Colors.white,
                                child: Text("User",style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white)),
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                 // user = 'guest';
                                  //futureEmail = getEmail(user);
                                  futureEmail.then((value){
                                    setState(() {
                                      email = value;
                                      emailController.text = email;
                                      passwordController.text = password;
                                    });
                                  });
                                },
                                color: Colors.purpleAccent,
                                textColor: Colors.white,
                                child: Text("Guest",style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),*/
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: textStyle,
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            validator:validateEmail,
                            /*(String value) {
                              if (value.isEmpty) {
                                return 'please enter a valid email';
                              }
                              return value;
                            },*/
                            decoration: InputDecoration(
                                hintText: "Enter a Email",
                                labelText: "Email",

                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                    color: Colors.pinkAccent, fontSize: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            style: textStyle,
                            controller: passwordController,

                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid password';
                              }
                              return value;
                            },
                            decoration: InputDecoration(
                                hintText: "Enter a Password",
                                labelText: "Password",

                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                    color: Colors.pinkAccent, fontSize: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.purple,
                            ),
                            child: Text(
                              "Login",
                              style: Theme.of(context).textTheme.headline.copyWith(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          onTap: () {

                            String email = emailController.text;
                            String password = passwordController.text;


                            if(email.length > 5 && password.length > 5){
                              setState(() {
                                isResponse = true;
                              });
                              Login(email, password).getData(context).then((result)=>{
//                                if(result){
//                                  debugPrint('success')
//                                }
                              });
                            }else{
                              setState(() {
                                isResponse = false;
                              });
                              Utils.showToast('Invalid email and password');
                            }
//                            setState(() {
//                              if (_formKey.currentState.validate()) {
//
//                                Utils.showToast('${emailController.text}  ${passwordController.text}');
//
//                                String email = emailController.text;
//                                String password = passwordController.text;
//
//                                debugPrint('$email  $password');
//
//                                Login(email, password).getData(context).then((result)=>{
//                                  if(result){
//                                    debugPrint('success')
//                                  }
//                                });
//                              }
//                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isResponse == true ? LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                          ):Text(''),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

 /* Future<String> getEmail(String user) async{

    final response = await http.get(UrlCollection.login_url);

    var jsonData = json.decode(response.body);

    return jsonData['data'][user]['email'];
  }*/

}