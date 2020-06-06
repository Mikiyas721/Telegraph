import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/passwordDataSource.dart';
import 'package:get_it/get_it.dart';
import 'package:Telegraph/models/password.dart';
import 'package:Telegraph/others/preferenceKeys.dart';

class PasswordBloc extends Disposable {
  PasswordRepo passwordRepo = GetIt.instance.get();
  CachePasswordDataSource passwordCache =
      CachePasswordDataSource(GetIt.instance.get());
  CacheIsLocked isLockedCache =
      CacheIsLocked(GetIt.instance.get());

  Stream<String> get passwordErrorStream {
    return passwordRepo.passwordSubject
        .map((PasswordModel password) => validatePassword(password.password));
  }

  bool savePassword() {
    final password = passwordRepo.passwordSubject.value.password;
    if (validatePassword(password) == null) {
      PreferenceKeys.setPreference<int>(
          PreferenceKeys.userPassword, int.parse(password));
      return true;
    }
    return false;
  }

  String validatePassword(String password) {
    return password.length >= 4 ? null : 'Password has to be 4 digits long';
  }

  @override
  void dispose() {}
}
