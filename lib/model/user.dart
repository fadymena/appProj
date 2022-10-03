import 'package:flutter_application_2/model/un_registred_user.dart';

class User extends UnRegUsr {
  String? _username;
  String? _password;
  String? _email;

  String? get getUserName {
    return _username;
  }

  String? get getEmail {
    return _email;
  }

  String? get getPasswd {
    return _password;
  }

  set setUserName(data) {
    _username = data;
  }

  set setEmail(data) {
    _email = data;
  }

  set setPasswd(data) {
    _password = data;
  }
}
