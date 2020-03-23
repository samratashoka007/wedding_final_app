import 'dart:async';

import 'validatemix.dart';


class Bloc extends Object with Validation{
  final _email=StreamController<String>.broadcast();
  final _password=StreamController<String>.broadcast();
  final _phoneno=StreamController<String>.broadcast();
  final _username=StreamController<String>.broadcast();

  Stream<String> get email=>_email.stream.transform(validationEmail);
  Stream<String> get password=>_password.stream.transform(validationPassword);
  Stream<String> get phoneno=>_phoneno.stream.transform(validationPhoneno);
  Stream<String> get username=>_username.stream.transform(validationUserName);

  Function(String) get changedEmail => _email.sink.add;
  Function(String) get changedPassword => _password.sink.add;
  Function(String) get changedPhoneno => _phoneno.sink.add;
  Function(String) get changedUsername => _username.sink.add;

  dispose(){
    _email.close();
    _password.close();
    _phoneno.close();
    _username.close();
  }
}
final bloc =Bloc();