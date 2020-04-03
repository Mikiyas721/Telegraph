class User {
  String _firstName;
  String lastName;
  String _phone;
  List<String> profilePictureURL;
  bool _online;
  DateTime _lastSeen;
  String _id;

  User(this._firstName, this._phone, this._online, this._lastSeen, this._id,
      {this.lastName, this.profilePictureURL});

  @override
  String toString() {
    return '''{
      "firstName": "$_firstName",
      "lastName": "$lastName",
      "imageURLs": [
         "$profilePictureURL"
      ],
      "online": $_online,
      "phoneNumber": $_phone,
      "lastSeen": "2020-04-03T15:38:46.383Z",
      "id": "$_id"
    }''';
  }

  String get getUserName => '$_firstName $lastName';

  String get getPhoneNumber => '$_phone';

  String get isOnline => '$_online';

  String get getLastSeen => '$_lastSeen';

  String get getId => '$_id';

  static String getDateTimeString(DateTime dateTime) {
    return '${dateTime.day} ${dateTime.month} ${dateTime.year}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['firstName'], json['phone'], json['online'],
        json['lastSeen'], json['id'],
        lastName: json['lastName'], profilePictureURL: json['imageURLs']);
  }

  User.toJson();
}
