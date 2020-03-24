


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wedding_final_app/app.dart';
import 'package:wedding_final_app/widget/AppBarWidget.dart';

class RsvpSection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RSVPData();
  }
}

class RSVPData extends State<RsvpSection> {
  int _n = 0;
  int _n1 = 0;
  String radioItem = '';
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.pinkAccent, //or set color with: Color(0xFF0000FF)


    ));
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Container(

      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'RSVP'),
        body: Container(
          child: ListView(
            children: <Widget>[

             Padding(
               padding: EdgeInsets.all(10.0),
               child: TextFormField(
                 keyboardType: TextInputType.text,
                 style: textStyle,
               //  controller: emailController,
                 textInputAction: TextInputAction.next,
                 //validator:validateEmail,
                 /*(String value) {
                              if (value.isEmpty) {
                                return 'please enter a valid email';
                              }
                              return value;
                            },*/
                 decoration: InputDecoration(
                     hintText: "Enter Your Name",
                     labelText: "Name",

                     labelStyle: textStyle,
                     errorStyle: TextStyle(
                         color: Colors.pinkAccent, fontSize: 15.0),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0),
                     )
                 ),

               ),
             ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new Text('Guest Information :',style: TextStyle(
                        fontSize: 20.0,

                      ),

                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: new Container(

                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[
                        Expanded(child:  new Text('No. of Guests \n(Including YourSelf) : ',style: TextStyle(
                           fontSize:15.0,
                           color: Colors.black
                              ),
                             ),
                         ),

                        SizedBox(height: 5.0,),
                        new FlatButton(
                          onPressed: add,
                          child: Image.asset('images/assets/addbtn.png',
                          height: 15.0,
                          width: 15.0,),
                        ),
                      /*  new FloatingActionButton(
                          onPressed: add,
                          heroTag: "btn1",
                          child: Image.asset('images/assets/addbtn.png'),
                          //child: new Icon(Icons.add, color: Colors.black),
                          backgroundColor: Colors.white,),
*/
                        new Text('$_n',
                            style: new TextStyle(fontSize: 20.0)),
                        new FlatButton(
                          onPressed: minus,
                          child: Image.asset('images/assets/minusbtn.png',
                            height: 15.0,
                            width: 15.0,),
                        ),
                      /*  new FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: minus,
                          child: new Icon(
                              const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                              color: Colors.black),
                          backgroundColor: Colors.white,),*/
                      ],
                    ),
                  ),

              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: new Container(
                  child: new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(child:  new Text('No. of Kids \n(If Applicable) : ',style: TextStyle(
                            fontSize:15.0,
                            color: Colors.black
                        ),
                        ),
                        ),
                       /* Padding(
                          padding: EdgeInsets.all(10.0),
                          child:
                        ),*/
                        new FlatButton(
                          onPressed: add1,

                          child: Image.asset('images/assets/addbtn.png',
                            height: 15.0,

                            width: 15.0,),
                        ),
                      /*  new Padding(padding: EdgeInsets.only(left: 5.0),
                           child:  new FloatingActionButton(

                              onPressed: add1,
                              child: new Icon(Icons.add, color: Colors.black,size: 10.0,),
                              backgroundColor: Colors.white,),
                        ),*/


                        new Text(
                            '$_n1',
                            style: new TextStyle(fontSize: 20.0)),

                      /*  new FloatingActionButton(
                          heroTag: "btn4",
                          onPressed: minus1,
                          child: new Icon(
                            const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                            color: Colors.black,size: 10.0,),
                          backgroundColor: Colors.white,
                        ),*/
                        new FlatButton(
                          onPressed: minus1,
                          child: Image.asset('images/assets/minusbtn.png',
                            height: 15.0,
                            width: 15.0,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
              /*  padding: EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text('I am Attending'),
                      new Column(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RadioListTile(
                            groupValue: radioItem,
                            title: Text('Radio Button Item 1'),
                            value: 'Item 1',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                              });
                            },
                          ),

                          RadioListTile(
                            groupValue: radioItem,
                            title: Text('Radio Button Item 2'),
                            value: 'Item 2',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                              });
                            },
                          ),

                          Text('$radioItem', style: TextStyle(fontSize: 23),)
                        ],
                      ),
                    ],
                  ),
                ),*/

                padding: EdgeInsets.all(10.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Text('I am Attending',style:TextStyle(
                      fontFamily: 'NotoSerif',
                      fontSize: 20.0,
                    ),),
                    RadioListTile(
                      groupValue: radioItem,
                      title: Text('In Marriage'),
                      value: 'Item 1',
                      onChanged: (val) {
                        setState(() {
                          radioItem = val;
                        });
                      },
                  ),

                  RadioListTile(
                    groupValue: radioItem,
                    title: Text('In Reception'),
                    value: 'Item 2',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                    RadioListTile(
                      groupValue: radioItem,
                      title: Text('Both'),
                      value: 'Item 3',
                      onChanged: (val) {
                        setState(() {
                          radioItem = val;
                        });
                      },
                    ),
                  Text('$radioItem', style: TextStyle(fontSize: 23),)
                ],
              ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: RaisedButton(

                    shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.circular(30.0)),
                          color: Colors.pink,
                            child: Text('Submit',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        left: 80.0,
                        right: 80.0,
                        top: 15.0,
                        bottom: 15.0),
                    onPressed:(){
                     // webCall();
                      // _navigator();

                      /*if(formKey.currentState.validate()){
            formKey.currentState.save();
          }*/
                    },
                  ),

                ),
              )
             ],
          ),
        ),
      ),
    );


  }


  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus1() {
    setState(() {
      if (_n1 != 0)
        _n1--;
    });
  }
  void add1() {
    setState(() {
      _n1++;
    });
  }
}
