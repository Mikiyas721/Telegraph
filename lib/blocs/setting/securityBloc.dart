import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:rxdart/rxdart.dart';

class SecurityBloc extends Disposable {
  final passwordStream = BehaviorSubject();
  final lastSeenStream = BehaviorSubject();
  final callStream = BehaviorSubject();

  Stream<String> get passwordErrorStream {
    return passwordStream.map((dynamic password) => validatePassword(password));
  }

  Function(String password) get addPassword => passwordStream.add;

  String validatePassword(String password) {
    return password.length >= 4 ? null : 'Password has to be 4 digits long';
  }

  bool savePassword() {
    final password = passwordStream.value;
    if (validatePassword(password) == null) {
      PreferenceKeys.setPreference<int>(PreferenceKeys.userPassword,int.parse(password));
      return true;
    }
    return false;
  }

  Stream<String> get lastSeen {
    return lastSeenStream.map((newValue) => newValue);
  }

  Function(String password) get setLastSeen => lastSeenStream.add;

  Stream<String> get calls {
    return callStream.map((newValue) => newValue);
  }

  Function(String password) get setCalls => callStream.add;

  @override
  void dispose() {
    passwordStream.close();
    lastSeenStream.close();
    callStream.close();
  }
}
