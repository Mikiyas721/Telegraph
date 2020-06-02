import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/json_model.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/myContact.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ContactDataSource extends CRUDSource<MyContact> {}

class CacheContactDataSource extends CacheCRUDSource<MyContact>
    implements ContactDataSource {
  CacheContactDataSource(
    SharedPreferences preference,
  ) : super(preference, 'contact', (map) => MyContact.fromMap(map));
}

class ContactRepo extends ItemRepo<MyContact, ContactDataSource> {
  ContactRepo(String key) : super(key) {
    get();
  }

  Stream<MyContact> get contactStream => item.map((contact) => contact);
}
