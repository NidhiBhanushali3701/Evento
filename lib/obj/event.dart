class Event {
  String _name, _description;
  var _img;
  DateTime _dateTime;
  int _noOfUsers;

  String get name {
    return _name;
  }

  void setName(String name) {
    _name = name;
  }

  String get description {
    return _name;
  }

  void setDescription(String description) {
    _description = description;
  }

  dynamic get img {
    return _img;
  }

  void setImg(var img) {
    _img = img;
  }

  DateTime get dateTime {
    return _dateTime;
  }

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
  }

  int get noOfUsers {
    return _noOfUsers;
  }

  void setNoOfUsers(int noOfUsers) {
    _noOfUsers = noOfUsers;
  }

  Map toMap() {
    var eventMap = {
      "eventName": _name,
      "eventImg": _img,
      "noOfUsers": _noOfUsers,
      "eventDescription": _description,
      "eventDateTime": _dateTime,
    };
    return eventMap;
  }
}
