import 'package:flutter/material.dart';
import 'package:wedding_final_app/guestroutes/guestinvitationlayout.dart';
import 'package:wedding_final_app/screens/AboutUs.dart';
import 'package:wedding_final_app/screens/RsvpSection.dart';
import 'package:wedding_final_app/screens/SettingsScreen.dart';
import 'package:wedding_final_app/palnnerscreen/adduserdata.dart';
import 'package:wedding_final_app/palnnerscreen/plannerhomescreen.dart';
import 'package:wedding_final_app/screens/Home.dart';
import 'package:wedding_final_app/screens/homescreen.dart';
import 'package:wedding_final_app/widget/ScaleRoute.dart';


class AppFunction {
static var planner=[
  'AddUsers',
  'ListOfUsers',
  'Settings',
  'AboutUs'
];
static var users=[
  'ChangeDetails',
  'AddGuest',
  'InvitationCard',
  'Events',
  'Relations',
  'Settings',
  'AboutUs',

];
static var guest=[
  'InvitationCard',
  'Events',
  'Relations',
  'AboutUs',
  'Settings',
  'RSVP'
];
static var plannerIcon = [
  'images/assets/adduser.png',
  'images/assets/events.png',
  'images/assets/adduser.png',
  'images/assets/about.png',
];
static var userIcons = [
  'images/assets/changedetails.png',
  'images/assets/adduser.png',
  'images/assets/events.png',
  'images/assets/calendar.png',

  'images/assets/relation.png',
  'images/assets/setting.png',
  'images/assets/about.png',
];
static var guestIcon = [
  'images/assets/adduser.png',
  'images/assets/events.png',
  'images/assets/adduser.png',
  'images/assets/about.png',
  'images/assets/setting.png',
  'images/assets/rsvp.png',
];
  static void getFunctions(BuildContext context, String rule) {
    Route route;

    switch (rule) {
      case '1':
        route =
            MaterialPageRoute(builder: (context) => Home(planner,plannerIcon));
        Navigator.pushReplacement(context, route);
        break;
      case '2':
        route = MaterialPageRoute(
            builder: (context) => Home(users,userIcons));
        Navigator.pushReplacement(context, route);
        break;
      case '3':
        route =
            MaterialPageRoute(builder: (context) =>Home(guest,guestIcon));
        Navigator.pushReplacement(context, route);
        break;
    /*  case '4':
        route = MaterialPageRoute(
            builder: (context) => HomeScreen());
        Navigator.pushReplacement(context, route);
        break;*/
    }
  }

  static void getPlanner(BuildContext context,String title){
    switch(title){
      case 'AddUsers':
        Navigator.push(context, ScaleRoute(page:AddUserData()));
        break;

      case 'ListOfUsers':
        break;

      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;

      case 'AboutUs':
        Navigator.push(context, ScaleRoute(page: AboutUs()));
        break;
    }
  }

  static void getUser(BuildContext context,String title){
    switch(title){
      case 'ChangeDetails':
        break;
      case 'AddGuest':
        Navigator.push(context, ScaleRoute(page:AddUserData()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
      case 'AboutUs':
        Navigator.push(context, ScaleRoute(page: AboutUs()));
        break;

    }
  }
static void getGuest(BuildContext context,String title){
  switch(title){
    case 'InvitationCard':
      Navigator.push(context, ScaleRoute(page: GuestInviattaionLayout()));
      break;
    case 'Settings':
      Navigator.push(context, ScaleRoute(page: SettingScreen()));
      break;
    case 'AboutUs':
      Navigator.push(context, ScaleRoute(page: AboutUs()));
      break;
    case 'RSVP':
      Navigator.push(context, ScaleRoute(page: RsvpSection()));
      break;

  }
}

}