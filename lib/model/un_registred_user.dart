class UnRegUsr {
  String? _name;
  String? _surname;
  String? _id;

  String? get getId {
    return _id;
  }

  String? get getName {
    return _name;
  }

  String? get getSurname {
    return _surname;
  }

  set setId(data) {
    _id = data;
  }

  set setName(data) {
    _name = data;
  }

  set setSurname(data) {
    _surname = data;
  }
}
