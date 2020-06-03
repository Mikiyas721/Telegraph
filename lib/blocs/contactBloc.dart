import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_permissions/simple_permissions.dart';

class ContactBloc extends Disposable{
  ContactRepo get contactRepo => GetIt.instance.get();

  Future<Iterable<Contact>> getContacts() async {
    Iterable<Contact> contacts;
    bool hasPermission =
    await SimplePermissions.checkPermission(Permission.ReadContacts);
    if (hasPermission) {
      contacts = await ContactsService.getContacts();
      return contacts;
    } else {
      PermissionStatus response =
      await SimplePermissions.requestPermission(Permission.ReadContacts);
      if (response == PermissionStatus.authorized) {
        contacts = await ContactsService.getContacts();
        return contacts;
      }
    }
    return contacts;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}