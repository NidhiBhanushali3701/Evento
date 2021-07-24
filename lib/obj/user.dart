class User {
  String _name, _password;
  var _img;
  DateTime _dob;

  String get name {
    return _name;
  }

  void setName(String name) {
    _name = name;
  }

  DateTime get dateTime {
    return _dob;
  }

  void setDateTime(DateTime dob) {
    _dob = dob;
  }

  dynamic get img {
    return _img;
  }

  void setImg(var img) {
    _img = img;
  }
}
