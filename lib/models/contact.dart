import 'package:Telegraph/core/json_model.dart';

class ContactModel extends JSONModel {
  final String firstName;

  ContactModel({String key})
      : firstName = key,
        super(key);

  @override
  Map<String, dynamic> toMap() {
    return {'firstName': firstName};
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(key: map['firstName']);
  }
}
