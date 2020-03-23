import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding_final_app/fetchalbum/fetchalbum.dart';
import 'package:wedding_final_app/model/weddingmodel.dart';
import 'package:wedding_final_app/widget/AppBarWidget.dart';

class GuestInviattaionLayout extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GuestLayout();
  }
}
class GuestLayout extends State<GuestInviattaionLayout> {

  Future<WeddingModel> futureAlbum;

  @override
  void initState() {
    super.initState();

    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.pinkAccent, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),

      child: Scaffold(
        appBar: AppBarWidget.header(context, 'InvitationCard'),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/assets/splashscreen.jpg',
                fit: BoxFit.cover,),
            ),
            Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 4.0,
                      sigmaY: 4.0
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.black12,
                    body: Container(),
                  ),
                )
            ),
            new Container(
              height: 300.0,
              color: Colors.transparent,
              child: new Card(
                  color: Colors.transparent,
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(46.0),
                          child: Text(
                            "Invitation",
                            style: TextStyle(
                                fontSize: 40.0,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSerif',
                                fontWeight: FontWeight.w800,
                              color: Colors.pinkAccent.shade700
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(50.0),
                          child: FutureBuilder<WeddingModel>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  child: Column(
                                    children: <Widget>[
                                      new Image.network(snapshot.data.image_url,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,),
                                      new Text(
                                        snapshot.data.body,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'NotoSerif',
                                            fontSize: 20),
                                      )

                                    ],
                                  ),
                                );
                                /* return Text(snapshot.data.body,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.w600,
                                 fontStyle: FontStyle.italic,
                                 fontFamily: 'NotoSerif',
                                 fontSize: 20),);*/
                              }
                              else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              // By default, show a loading spinner.
                              return CircularProgressIndicator();
                            },
                          ),
                          /*child: Text(

                         'Together with their families \nDivyanka and Vivek\n Request the Pleasure of Your compnay at the celebration of their marriage Saturday,the \n8th June 2020 .\nRasraj jackpot, Naroda ,Ahmedabad,Gujarat -380008',
                         textAlign: TextAlign.center,
                         style: TextStyle(

                             color: Colors.white,
                             fontWeight: FontWeight.w600,
                             fontStyle: FontStyle.italic,
                             fontFamily: 'NotoSerif',
                             fontSize: 20),
                       ),*/
                        ),
                        /* Padding(
                       padding: const EdgeInsets.only(top:16.0),


                     ),*/

                      ],
                    ),
                  )),
            ),

          ],
        ),
      ),


    );
    Widget build(context) {
      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/assets/splashscreen.jpg',
                fit: BoxFit.cover,),
            ),
            Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 4.0,
                      sigmaY: 4.0
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.black12,
                    body: Container(),
                  ),
                )
            ),
            new Container(
              height: 300.0,
              color: Colors.transparent,
              child: new Card(
                  color: Colors.transparent,
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(46.0),
                          child: Text(
                            "Invitation",
                            style: TextStyle(
                                fontSize: 40.0,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSerif',
                                fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(50.0),
                          child: FutureBuilder<WeddingModel>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  child: Column(
                                    children: <Widget>[
                                      new Image.network(snapshot.data.image_url,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,),
                                      new Text(
                                        snapshot.data.body,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'NotoSerif',
                                            fontSize: 20),
                                      )

                                    ],
                                  ),
                                );
                                /* return Text(snapshot.data.body,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.w600,
                                 fontStyle: FontStyle.italic,
                                 fontFamily: 'NotoSerif',
                                 fontSize: 20),);*/
                              }
                              else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              // By default, show a loading spinner.
                              return CircularProgressIndicator();
                            },
                          ),
                          /*child: Text(

                         'Together with their families \nDivyanka and Vivek\n Request the Pleasure of Your compnay at the celebration of their marriage Saturday,the \n8th June 2020 .\nRasraj jackpot, Naroda ,Ahmedabad,Gujarat -380008',
                         textAlign: TextAlign.center,
                         style: TextStyle(

                             color: Colors.white,
                             fontWeight: FontWeight.w600,
                             fontStyle: FontStyle.italic,
                             fontFamily: 'NotoSerif',
                             fontSize: 20),
                       ),*/
                        ),
                        /* Padding(
                       padding: const EdgeInsets.only(top:16.0),


                     ),*/

                      ],
                    ),
                  )),
            ),

          ],
        ),
      );
    }
  }
}
