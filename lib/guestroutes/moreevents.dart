import 'package:flutter/cupertino.dart';
import 'package:wedding_final_app/model/EventsData.dart';
import 'package:flutter/material.dart';

class MoreEvents extends StatelessWidget {
  final int clickedIndex;

  const MoreEvents(this.clickedIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('Clicked Index is: $clickedIndex'),
      ),
    );
  }
  // Declare a field that holds the Todo.
 /* final String itemHolder ;

  MoreEvents({Key key, @required this.itemHolder}) : super(key: key);

 *//* goBack(BuildContext context){
    Navigator.pop(context);
  }*//*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Activity Screen"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child:
                Text('Selected Item = ' + itemHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,)),

              *//*RaisedButton(
                onPressed: () {goBack(context);},
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Go Back To Previous Screen'),
              )*//*])
    );
  }*/
}