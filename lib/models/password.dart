import 'package:Telegraph/core/json_model.dart';

class PasswordModel extends JSONModel {
  final String password;

  PasswordModel({String password})
      : password = password,
        super(password);

  @override
  Map<String, dynamic> toMap() {
    return {'password': password};
  }

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(password: map['password']);
  }
  String toString(){
    return password;
  }
}
