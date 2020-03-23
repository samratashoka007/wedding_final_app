import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding_final_app/main.dart';
import 'package:wedding_final_app/utils/Utils.dart';
import 'package:wedding_final_app/widget/AppBarWidget.dart';
import 'package:wedding_final_app/widget/Line.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<bool> isSelected = [false, false];
  GlobalKey _scaffold = GlobalKey();

  @override
  void initState() {
    super.initState();
    Utils.getIntValue('locale').then((value) {
      setState(() {
        isSelected[value] = true;
        //Utils.showToast('$value');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.pinkAccent, //or set color with: Color(0xFF0000FF)
    ));
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'Settings'),
        backgroundColor: Colors.white,
        key: _scaffold,
        /*body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: toggleButton(context),
                ),
                elevation: 5.0,
              ),
            ),

           BottomLine(),

          ],
        ),*/
        body: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 10.0),
                    child: toggleButton(context),
                  ),
                  elevation: 5.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleButton(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'System Locale',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          ToggleButtons(
            borderColor: Colors.pinkAccent,
            fillColor: Colors.pink.shade200,
            borderWidth: 2,
            selectedBorderColor: Colors.pinkAccent,
            selectedColor: Colors.white,
            borderRadius: BorderRadius.circular(0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'RTL',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'popins',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'LTL',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'popins',
                  ),
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                Utils.saveIntValue('locale', index);
                rebuildAllChildren(context);
                for (int i = 0; i < isSelected.length; i++) {
                  if (i == index) {
                    isSelected[i] = true;
                  } else {
                    isSelected[i] = false;
                  }
                }
              });
            },
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }

//  showChangeLanguageAlert(BuildContext context) {
//    showDialog<void>(
//      barrierDismissible: true,
//      context: context,
//      builder: (BuildContext context) {
//        return Column(
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(0),
//              child: Container(
//                height: MediaQuery.of(context).size.height / 3,
//                width: MediaQuery.of(context).size.width,
//                color: Colors.white,
//                child: Padding(
//                    padding: const EdgeInsets.only(left: 20.0, top: 20.0,right: 20.0),
//                    child: ListView.builder(
//                     // itemCount: languagesList.length,
//                      itemBuilder: (context, index) {
//                        return Column(
//                          children: <Widget>[
//                            GestureDetector(
//                              onTap: (){
//                               // Utils.saveStringValue('lang', languagesMap[languagesList[index]]);
//                              //  application.onLocaleChanged(Locale(languagesMap[languagesList[index]]));
//                                rebuildAllChildren(context);
//                              },
//                              child: Text(
//                                languagesList[index],
//                                style: Theme.of(context)
//                                    .textTheme
//                                    .headline,
//                              ),
//                            ),
//                           // BottomLine(),
//                          ],
//                        );
//                      },
//                    )
//                ),
//              ),
//            ),
//          ],
//        );
//      },
//    );
//  }

  void rebuildAllChildren(BuildContext context) {
//    Navigator.of(context)
//        .push(MaterialPageRoute(builder: (BuildContext context) {
//      return MyApp();
    Route route = MaterialPageRoute(builder: (context) => MyApp());
    Navigator.pushAndRemoveUntil(context, route, ModalRoute.withName('/'));
  }
}
