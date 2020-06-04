import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_permissions/simple_permissions.dart';

import '../data/http.dart';

class ContactBloc extends Disposable {
  ContactRepo get contactRepo => GetIt.instance.get();

  getContacts(String userId) async {
    List<dynamic> apiContacts = await Http.getContactsForUser(userId);

    List<ContactModel> fromPhoneContacts = List<ContactModel>();
    Iterable<Contact> contacts;
    bool hasReadContactPermission =
        await SimplePermissions.checkPermission(Permission.ReadContacts);
    bool hasWriteContactPermission =
        await SimplePermissions.checkPermission(Permission.WriteContacts);
    hasReadContactPermission
        ? contacts = await ContactsService.getContacts()
        : SimplePermissions.requestPermission(Permission.ReadContacts);
    if(!hasWriteContactPermission)
         SimplePermissions.requestPermission(Permission.WriteContacts);

    if (hasReadContactPermission) {
    } else {
      PermissionStatus response =
          await SimplePermissions.requestPermission(Permission.ReadContacts);
      if (response == PermissionStatus.authorized) {
        contacts = await ContactsService.getContacts();
      }
    }
    contacts = contacts.toList();
    if (contacts != null) {
      for (Contact contact in contacts) {
        Iterable<Item> numbers = contact.phones;
        numbers = numbers.toList();
        for (Item number in numbers) {
          List<dynamic> user = await Http.getUserByNumber(number.value);
          if (user.isNotEmpty) {
            fromPhoneContacts.add(ContactModel(
              key: number.value,
              firstName: contact.givenName,
              lastName: contact.displayName,
            ));
            break;
          }
        }
      }
      //write to phone these contacts
      //ContactsService.addContact();
    }
  }

  Future<dynamic> postContact(ContactModel contactModel) async {
    await Http.addContact(contactModel);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
