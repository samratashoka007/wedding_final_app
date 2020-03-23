import 'dart:async';

import 'dart:math';

class Validation{
final validationEmail=StreamTransformer<String,String>.fromHandlers(
  handleData: (email,sink){
    if(email.contains('@')){
      sink.add(email);
    }
    else{
      sink.addError('Enter a valid email');
    }
  }
);

 final validationPassword=StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length>4){
        sink.add(password);
      }
      else{
        sink.addError('Password must be at least 4 length');
      }
    }
  );

final validationPhoneno=StreamTransformer<String,String>.fromHandlers(
    handleData: (phoneno,sink){
      if(phoneno.length>12){
        sink.add(phoneno);
      }
      else{
        sink.addError('Phone Number must be at least 12 didgit with country code');
      }
    }
);
final validationUserName=StreamTransformer<String,String>.fromHandlers(
    handleData: (username,sink){
      if(username.length>4){
        sink.add(username);
      }
      else{
        sink.addError('Username must be at least 4 length');
      }
    }
);

 String validateName(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Name is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String validateMobile(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Mobile is Required";
  } else if(value.length != 10){
    return "Mobile number must 10 digits";
  }else if (!regExp.hasMatch(value)) {
    return "Mobile Number must be digits";
  }
  return null;
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
}
