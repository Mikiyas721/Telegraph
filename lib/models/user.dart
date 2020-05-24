import 'package:Telegraph/controll/others/assistant.dart';

class User {
  String _firstName;
  String _lastName;
  String _phone;
  List<String> profilePictureURL;
  bool _online;
  DateTime _lastSeen;
  String _id;

  User(this._firstName, this._phone, this._online, this._lastSeen, this._id,
      {lastName, this.profilePictureURL})
      : _lastName = lastName;

  @override
  String toString() {
    return '''{
      "firstName": "$_firstName",
      "lastName": "$_lastName",
      "imageURLs": 
         ${profilePictureURL.toString()}
      ,
      "online": "$_online",
      "phoneNumber": "$_phone",
      "lastSeen": "${Assistant.getDateString(_lastSeen)}"/// NOTE didn't add id because it causes error in post request      
    }''';
  }

  String get getUserName => '$_firstName $_lastName';

  String get getFirstName => '$_firstName';

  String get getLastName => '$_lastName';

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
        lastName: Assistant.getDateTime(json['lastName']),
        profilePictureURL: json['imageURLs']);
  }

  User.toJson();
}
