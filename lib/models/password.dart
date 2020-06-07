import 'package:Telegraph/core/jsonModel.dart';

class PasswordModel extends JSONModel {
  final String _password;
  final bool _isLocked;

  PasswordModel({String password, bool isLocked})
      : _password = password,
        _isLocked = isLocked,
        super(password);

  String get password => _password;

  bool get isLocked => _isLocked;

  @override
  Map<String, dynamic> toMap() {
    return {'password': _password, 'isLocked': _isLocked};
  }

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(password: map['password'], isLocked: map['isLocked']);
  }

  String toString() {
    return _password;
  }
}
