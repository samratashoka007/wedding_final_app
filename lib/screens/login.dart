import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_final_app/bloc/Urlconnection.dart';

import '../utils/FunctinsData.dart';

class Login {
  final String email;
  final String password;

  Login(this.email,this.password);

  Future getData(BuildContext context) async {
    bool isSuccessed;
    int id;
    String rule;
   // String image;
    var data = { 'email': email, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(UrlCollection.login_url,body: data);

    //Response response = await http.post(UrlCollection.login_url);
    //http.Response response = await http.post(UrlCollection.login(email, password));
    var data1 = jsonDecode(response.body);
    print(data1.toString());

    if (response.statusCode == 200) {
      Map<String, dynamic> user = jsonDecode(response.body) as Map;

      isSuccessed = user['logged_in'];
    //  id = user['data']['user']['id'];
      rule = user['role'];
    //  image = user['data']['userDetails']['staff_photo'];

      if (isSuccessed) {
        saveBooleanValue('logged_in', isSuccessed);
        saveStringValue('email', email);
        saveStringValue('password', password);
        saveStringValue('role', '$rule');
    //    saveStringValue('id','$id');

   //     saveStringValue('image', '$image');
   //     saveStringValue('lang', 'en');
        AppFunction.getFunctions(context,rule.toString());
      }


    }
    else{
      Fluttertoast.showToast(msg: "Please Check Internet Connection");
    }
    return isSuccessed;
  }

  Future<bool> saveBooleanValue(String key ,bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(key, value);
  }

  Future<bool> saveStringValue(String key ,String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

}
