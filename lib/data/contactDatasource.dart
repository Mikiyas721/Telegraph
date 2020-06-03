import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ContactDataSource extends CRUDSource<ContactModel> {}

class CacheContactDataSource extends CacheCRUDSource<ContactModel>
    implements ContactDataSource {
  CacheContactDataSource(
    SharedPreferences preference,
  ) : super(preference, 'contact', (map) => ContactModel.fromMap(map));
}

class ContactRepo extends ItemRepo<ContactModel, ContactDataSource> {
  ContactRepo(String key) : super(key) {
    get();
  }
  Stream<ContactModel> get contactStream => item.map((contact) => contact);
}
