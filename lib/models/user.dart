class User {
  String _firstName;
  String lastName;
  String _phone;
  String profilePictureURL;
  bool _online;
  DateTime _lastSeen;

  User(this._firstName, this._phone, this._online, this._lastSeen,
      {this.lastName, this.profilePictureURL});

  @override
  String toString() {
    return '''
         User{
             firstName: $_firstName,
             lastName: $lastName,
             phone: $_phone,
             profilePictureURL: $profilePictureURL,
             online: $_online,
             lastSeen: ${getDateTimeString(_lastSeen)}
         }
    ''';
  }

  String get getUserName => '$_firstName $lastName';

  String get getPhoneNumber => '$_phone';

  static String getDateTimeString(DateTime dateTime) {
    return '${dateTime.day} ${dateTime.month} ${dateTime.year}';
  }
}
