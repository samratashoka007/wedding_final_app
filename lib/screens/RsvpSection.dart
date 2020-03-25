import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding_final_app/app.dart';
import 'package:wedding_final_app/widget/AppBarWidget.dart';

class RsvpSection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RSVPData();
  }
}

class RSVPData extends State{

  Widget build(context){
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
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 10.0),
                    child: firstSection(context),
                  ),
                  elevation: 5.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:Card(
                  child: Column(
                    children: <Widget>[
                      guestInfo(context),
                      kidsInfo(context),
                      attending(context),
                      submitBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  Widget firstSection(context){
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Container(
      //child: Row(
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        child:          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: textStyle,
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                labelText: 'Name',
                labelStyle: textStyle,
                errorStyle: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 15.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              ),
            ),
          )
       // ],
      //),
    );
  }
  int _n = 0;
  int _n1 = 0;
  Widget guestInfo(context){
    TextStyle textStyle = Theme.of(context).textTheme.title;
    String radioItem = '';
    /*int _n = 0;
    int _n1 = 0;*/
    return Container(
      //child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        child:          Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             new Text('Guest Information',
               style:TextStyle(
                   fontFamily: 'NotoSerif',
                   fontSize: 20.0,
                   color: Colors.pink.shade700
               ),),
            new Row(

              children: <Widget>[

                 Text('No. of Guest \n(Including Yourself)'),
                Row(
                  children: <Widget>[
                    new FlatButton(
                      onPressed: add,
                      child: Image.asset('images/assets/addbtn.png',
                        height: 15.0,
                        width: 15.0,),
                    ),
                    new Text('$_n',
                        style: new TextStyle(fontSize: 20.0)),
                    new FlatButton(
                      onPressed: minus,
                      child: Image.asset('images/assets/minusbtn.png',
                        height: 15.0,
                        width: 15.0,),
                    ),
                  ],
                ),

              ],
            )

            ],
          ),

        )
      // ],
      //),
    );
  }
  Widget kidsInfo(context){
    TextStyle textStyle = Theme.of(context).textTheme.title;
    String radioItem = '';
    /*int _n = 0;
    int _n1 = 0;*/
    return Container(
      //child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        child:          Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text('Kids Information',
                style:TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 20.0,
                    color: Colors.pink.shade700
                ),),
              new Row(

                children: <Widget>[

                  Text('No. of Kids \n(If Applicable)'),
                  Row(
                    children: <Widget>[
                      new FlatButton(
                        onPressed: add1,
                        child: Image.asset('images/assets/addbtn.png',
                          height: 15.0,
                          width: 15.0,),
                      ),
                      new Text('$_n1',
                          style: new TextStyle(fontSize: 20.0)),
                      new FlatButton(
                        onPressed: minus1,
                        child: Image.asset('images/assets/minusbtn.png',
                          height: 15.0,
                          width: 15.0,),
                      ),
                    ],
                  ),

                ],
              )

            ],
          ),

        )
      // ],
      //),
    );
  }
  String radioItem = '';
  Widget attending(context){
    TextStyle textStyle = Theme.of(context).textTheme.title;

    /*int _n = 0;
    int _n1 = 0;*/
    return Container(
      //child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        child:          Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text('I am Attending',
                style:TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 20.0,
                    color: Colors.pink.shade700
                ),),
              new Row(

                children: <Widget>[

                Flexible(
                 //padding: EdgeInsets.all(10.0),
                  child:  RadioListTile(

                    groupValue: radioItem,
                    title: Text('In Marriage'),
                    value: 'Mrg',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                ],
              ),
              new Row(

                children: <Widget>[

                  Flexible(
                   // padding: EdgeInsets.all(10.0),
                    child:  RadioListTile(

                      groupValue: radioItem,
                      title: Text('In Reception'),
                      value: 'Reception',
                      onChanged: (val) {
                        setState(() {
                          radioItem = val;
                        });
                      },
                    ),
                  ),
                ],
              ),new Row(

                children: <Widget>[

                  Flexible(

                   // padding: EdgeInsets.all(10.0),
                    child:  RadioListTile(

                      groupValue: radioItem,
                      title: Text('Both'),
                      value: 'Both',
                      onChanged: (val) {
                        setState(() {
                          radioItem = val;
                        });
                      },
                    ),
                  ),
                ],
              ),

             // Text('$radioItem', style: TextStyle(fontSize: 10),)
            ],
          ),
        )
      // ],
      //),
    );
  }
  Widget submitBtn(context){
    return  Padding(
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