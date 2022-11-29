import 'package:flutter_application_2/model/un_registred_user.dart';

class RegUser extends UnRegUsr {
  static String _name = '';
  static String _email = '';
  static String _surname = '';
  static bool _flage = false;
  //final String _lastLogin;
  static String _id = '';
  //List<WatchlistItem>? _watchlist;
  RegUser._init(String name, String surname, String email, String id) {
    _name = name;
    _email = email;
    _surname = surname;
    _id = id;
  }
  static late RegUser _istance;
  factory RegUser(
      String name, String surname, String email, String id, bool reg) {
    if (!_flage || reg) {
      _flage = true;
      _istance = RegUser._init(name, surname, email, id);
    }
    return _istance;
  }
  static get getIstance {
    // if (!_flage) {
    //   _flage = true;
    //   _istance = RegUser._Scon('demoName', 'demoSurname', 'demo@demo.com','demoID');
    // }
    return _istance;
  }

  static String get getMyId => _id;
  static String get getMyName => _name;
  static String get getMySurname => _surname;
  static String get getMyEmail => _email;

  //  = RegUser._Scon();
  // static RegUser get istance => _istance;
}
//Todo: data disapear when app refreshed, try factory method insted of get
