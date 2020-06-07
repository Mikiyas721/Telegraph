import 'package:Telegraph/core/jsonModel.dart';

class ContactModel extends JSONModel {
  final String firstName;
  final String lastName;
  final String lastSeen;
  final String phoneNumber;
  final String userId;

  ContactModel(
      {String key, this.firstName, this.lastSeen, this.lastName, this.userId})
      : phoneNumber = key,
        super(key);

  @override
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'userId': userId
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
        key: map['phoneNumber'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        userId: map['userId']);
  }
}
