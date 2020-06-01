import 'package:simple_permissions/simple_permissions.dart';
import 'package:contacts_service/contacts_service.dart';

getContacts() async {
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
