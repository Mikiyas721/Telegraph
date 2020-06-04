import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ContactDataSource extends CRUDListSource<ContactModel> {}

class CacheContactDataSource extends CacheCRUDListSource<ContactModel>
    implements ContactDataSource {
  CacheContactDataSource(
    SharedPreferences preference,
  ) : super(preference, 'contact', (map) => ContactModel.fromMap(map));
}

class ContactRepo extends ListRepo<ContactModel, ContactDataSource> {
  ContactRepo(String key) : super(key) {
    get();
  }
  Stream<List<ContactModel>> get contactStream => items.map((contact) => contact);
}
