import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/passwordDataSource.dart';
import 'package:Telegraph/data/valueDataSource.dart';
import 'package:get_it/get_it.dart';
import 'package:Telegraph/models/password.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';

class PasswordBloc extends Disposable {
  PasswordRepo passwordRepo = GetIt.instance.get();
  ValueRepo valueRepo = GetIt.instance.get();

  Stream<String> get passwordErrorStream {
    return passwordRepo.passwordSubject
        .map((PasswordModel password) => validatePassword(password.password));
  }

  bool savePassword() {
    final password = passwordRepo.passwordSubject.value.password;
    if (validatePassword(password) == null) {
      passwordRepo.setPreference<int>(
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
