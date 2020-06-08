import 'package:Telegraph/core/jsonModel.dart';
import 'package:Telegraph/others/assistant.dart';

class UserModel extends JSONModel {
  final String _firstName;
  final String _lastName;
  final String _phoneNumber;

  /* final List<String> _profilePictureURL;*/
  final DateTime _lastSeen;
  final String _id;
  final String _countryCode;

  UserModel({firstName, phone, lastSeen, id, lastName, countryCode})
      : _firstName = firstName,
        _phoneNumber = phone,
        _lastName = lastName,
        _lastSeen = lastSeen,
        _countryCode = countryCode,
        _id = id,
        super(phone);

  @override
  String toString() {
    return '''{
      "firstName": "$_firstName",
      "lastName": "$_lastName",
      "phoneNumber": "$_phoneNumber",
      "lastSeen": "${Assistant.getDateString(_lastSeen)}"/// NOTE didn't add id because it causes error in post request      
    }''';
  }

  String get getUserName => '$_firstName $_lastName';

  String get getFirstName => '$_firstName';

  String get getLastName => '$_lastName';

  String get getPhoneNumber => '$_phoneNumber';

  String get getCountryCode => '$_countryCode';

  String get getLastSeen => '$_lastSeen';

  String get getId => '$_id';

  static String getDateTimeString(DateTime dateTime) {
    return '${dateTime.day} ${dateTime.month} ${dateTime.year}';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json['firstName'],
        id: json['id'],
        lastSeen: Assistant.getDateTime(json['lastName']),
        phone: json['phone'],
        countryCode: json['countryCode'],
        lastName: json['lastName']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'firstName': _firstName,
      'lastName': _lastName,
      'lastSeen': _lastSeen,
      'countryCode': _countryCode,
      'countryCode': _id,
      'countryCode': _phoneNumber, //TODO add Profile Picture URL
    };
  }

  String getPhoneNumberString() {
    if (_phoneNumber.startsWith('0')) {
      String number = _phoneNumber.substring(1);
      return '$_countryCode$number';
    } else
      return '$_countryCode$_phoneNumber';
  }
}
