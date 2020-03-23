import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wedding_final_app/bloc/Urlconnection.dart';

import 'package:wedding_final_app/bloc/bloc.dart';
import 'package:http/http.dart'as http;
import 'package:wedding_final_app/bloc/validatemix.dart';
import 'package:wedding_final_app/palnnerscreen/plannerhomescreen.dart';
import 'package:wedding_final_app/widget/AppBarWidget.dart';
import 'package:wedding_final_app/widget/Line.dart';

import '../app.dart';

class AddUserData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserData();
  }
}

class UserData extends State {
  GlobalKey _scaffold = GlobalKey();
  Validation validation=Validation();
  TextEditingController groomname = new TextEditingController();
  TextEditingController bridename = new TextEditingController();
  TextEditingController weddingid = new TextEditingController();
  TextEditingController userid = new TextEditingController();
  TextEditingController passwordMain = new TextEditingController();
  TextEditingController phoneno = new TextEditingController();
  TextEditingController emailid = new TextEditingController();
  bool visible = false;
  @override
  void initState() {
    super.initState();
  }
  Future webCall() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String bname = bridename.text;
    String gname = groomname.text;
    String email = emailid.text;
    String password=passwordMain.text;
    String phoneNumber = phoneno.text;
    String wedid=weddingid.text;
    String uid=userid.text;

    // API URL
    var url = UrlCollection.add_user_url;

    // Store all data with Param Name.
    var data = {'groom_name': gname,'bride_name':bname,'contact_no':phoneNumber, 'email': email, 'password': password};

    // Starting Web Call with data.
    var response = await http.post(url, body: (data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        /* return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );*/
         return CupertinoAlertDialog(
            title: Text("SuccessFully"),
            content: Text(message),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "OK", toastLength: Toast.LENGTH_LONG);
                  Navigator.of(context).pop();
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlannerHomeScreen()),);*/

                },
              ),

            ],
          );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.pinkAccent, //or set color with: Color(0xFF0000FF)
    ));
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'Add User'),

        backgroundColor: Colors.white,
        key: _scaffold,
        body: ListView(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(10.0),
              child: Form(
                autovalidate: false,

                child: Column(

                  children: <Widget>[

                    WeddingId(),
                    //UserId(),
                    GroomForm(),
                    BrideForm(),
                    EmailForm(),
                    PasswordForm(),
                    PhoneNoForm(),
                    DateOfWedding(),
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
            ),

          ],
        ),
      ),
    );

  }
  String _date = "Not set";
  Widget WeddingId(){
    return StreamBuilder(
      stream: bloc.username,
      builder: (context,snapshot){
        return Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

           Column(
             children: <Widget>[
               Text("Weddin ID : ",textAlign:TextAlign.center,
                 style: TextStyle(
                 fontSize: 20.0,
               ),)
             ],
           ),
           Column(
             children: <Widget>[
               Text("1 ",textAlign:TextAlign.center,
                  style: TextStyle(
                   fontSize: 20.0,))
             ],
           )
         ],
        );
      },
    );

  }
  Widget UserId(){
    return StreamBuilder(
      stream: bloc.username,
      builder: (context,snapshot){
        return TextFormField(
          controller: userid,
          onChanged: (newUserName){
            bloc.changedUsername(newUserName);
          },
          validator:validation.validateName ,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Enter Groom Name',
            hintText: 'Enter Groom Name',
            errorText: snapshot.error,
          ),
        );
      },
    );

  }
  Widget EmailForm(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snapshot){
        return TextFormField(
          controller: emailid,
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
  Widget GroomForm(){
    return StreamBuilder(
      stream: bloc.username,
      builder: (context,snapshot){
        return TextFormField(
          controller: groomname,
          onChanged: (newUserName){
            bloc.changedUsername(newUserName);
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Enter Groom Name',
            hintText: 'Enter Groom Name',
            errorText: snapshot.error,
          ),
        );
      },
    );

  }
  Widget BrideForm(){
    return StreamBuilder(
      stream: bloc.username,
      builder: (context,snapshot){
        return TextFormField(
          controller: bridename,
          onChanged: (newUserName){
            bloc.changedUsername(newUserName);
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Enter Bride Name',
            hintText: 'Enter Groom Name',
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
          controller: passwordMain,
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
          controller: phoneno,
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

  Widget DateOfWedding(){



   return  RaisedButton(
       shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(5.0)),
         elevation: 4.0,
            onPressed: () {
                DatePicker.showDatePicker(context,
            theme: DatePickerTheme(
            containerHeight: 210.0,
            ),
          showTitleActions: true,
            minTime: DateTime(2000, 1, 1),
            maxTime: DateTime(3000, 12, 31), onConfirm: (date) {
            print('confirm $date');
            _date = '${date.year} - ${date.month} - ${date.day}';
            setState(() {});
            }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Row(
                      children: <Widget>[
                         Container(
                              child: Row(
                                  children: <Widget>[
                                          Icon(
                                          Icons.date_range,
                                          size: 18.0,
                                          color: Colors.black,
                                           ),
                                     Text(
                                           " $_date",
                                          style: TextStyle(
                                            color: Colors.black,
                                         fontWeight: FontWeight.normal,
                                       fontSize: 18.0),
                                         ),
                                    ],
                                   ),
                         )      ],
                     ),
                    Text(
                        "  Change",
                         style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                       ),
                     ],
                   ),
            ),
     color: Colors.white,
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
        child: Text('Add',
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
          webCall();
          // _navigator();

          /*if(formKey.currentState.validate()){
            formKey.currentState.save();
          }*/
        },
      ),

    );
  }
}








