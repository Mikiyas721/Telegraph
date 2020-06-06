import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/password.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PasswordDataSource extends CRUDSource<PasswordModel> {}

class CachePasswordDataSource extends CacheCRUDSource<PasswordModel>
    implements PasswordDataSource {
  CachePasswordDataSource(SharedPreferences preference)
      : super(preference, PreferenceKeys.userPassword, (map) => PasswordModel.fromMap(map));
}

class CacheIsLocked extends CacheCRUDSource {
  CacheIsLocked(SharedPreferences preference)
      : super(preference, PreferenceKeys.isLocked, (map) => PasswordModel.fromMap(map));
}

class PasswordRepo extends ItemRepo<PasswordModel, PasswordDataSource> {
  PasswordRepo(String key) : super(key);

  BehaviorSubject<PasswordModel> get passwordSubject => item;

  Stream<PasswordModel> get passwordStream => item.map((password) => password);

  Function(PasswordModel passwordModel) get setPassword => item.add;
}
