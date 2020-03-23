
import 'package:crashlytics/crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:wedding_final_app/screens/splashscreen.dart';
import 'package:wedding_final_app/theme.dart';
import 'package:wedding_final_app/utils/Utils.dart';


import 'app.dart';


void main() {
  //Crashlytics.setup();
  runApp( new MyApp(),
  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  bool isRTL;

  @override
  void initState() {
    super.initState();
    Utils.getIntValue('locale').then((value) {
      setState(() {
        isRTL = value == 0 ? true : false;
        //Utils.showToast('$isRTL');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return isRTL != null ? isRTL
        ? MaterialApp(
              title: "Wedding Planner",
              debugShowCheckedModeBanner: false,
              theme: basicTheme(),
              home: Scaffold(
                body: SplashScreen(),
              ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
    )
        : MaterialApp(
          title: "Wedding Planner",
          debugShowCheckedModeBanner: false,
          theme: basicTheme(),
          home: Scaffold(
            body: SplashScreen(),
      ),
    ): Material(child: Directionality(textDirection: TextDirection.ltr,child: Center(child: Text('Loading...'))));
  }
}
