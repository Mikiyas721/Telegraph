import 'package:Telegraph/core/jsonModel.dart';
import 'package:hive/hive.dart';

class ContactModel extends JSONModel {
  final String initials;
  final String firstName;
  final String lastName;
  final String lastSeen;
  final String phoneNumber;
  final String countryCode;
  final String userId;

  ContactModel(
      {String phoneNumber,
      this.initials,
      this.firstName,
      this.countryCode,
      this.lastSeen,
      this.lastName,
      this.userId})
      : phoneNumber = phoneNumber,
        super(phoneNumber);

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
        phoneNumber: map['phoneNumber'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        userId: map['userId']);
  }

  String get name => lastName == null ? firstName : firstName + " " + lastName;
}

class ContactAdapter extends TypeAdapter<ContactModel> {
  @override
  read(BinaryReader reader) {
    return null;
  }

  @override
  int get typeId => 33;

  @override
  void write(BinaryWriter writer, obj) {}
}
