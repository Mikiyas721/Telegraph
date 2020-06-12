import 'dart:io';
import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ContactBloc extends Disposable {
  ContactRepo get contactRepo => GetIt.instance.get();

  void fetchFriendsWithAccount() async {
    List<Contact> contacts = await contactRepo.getPhoneContacts();
    List<ContactModel> allApiContacts = await contactRepo.getAllContacts();
    List<ContactModel> friendsWithAccount = List();
    for (Contact contact in contacts) {
      for (ContactModel api in allApiContacts) {
        if (contact.phones.toList().isNotEmpty &&
            contact.phones.toList()[0].toString() == api.phoneNumber) {
          friendsWithAccount.add(api);
          contactRepo.setApiContact(friendsWithAccount);
          break;
        }
      }
    }
  }

  void fetchPhoneContacts() async {
    await Assistant.getPermission();
    /*Directory appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    Hive.registerAdapter<ContactModel>(ContactAdapter());
    final contactsBox = await Hive.openBox('contacts');
    dynamic contacts = contactsBox.get('phone_contacts');
    if (contacts != null)
      return contacts;
    else {*/
      await Assistant.getPermission();
      List<Contact> contacts = await contactRepo.getPhoneContacts();
      List<ContactModel> contactModel = List();
      for (Contact contact in contacts) {
        contactModel.add(ContactModel(
            initials: contact.initials(),
            firstName: contact.givenName,
            phoneNumber: contact.phones.toList().isEmpty
                ? contact.displayName
                : contact.phones.toList()[0].toString()));
        contactRepo.setPhoneContact(contactModel);

      //contactsBox.put('phone_contacts', contactModel);
    }
  }

  void fetchApiContacts() async {
    List<ContactModel> allApiContacts = await contactRepo.getApiContacts();
    List<ContactModel> apiAccounts = List();
    for (ContactModel api in allApiContacts) {
      apiAccounts.add(api);
      contactRepo.setApiContact(apiAccounts);
    }
  }

  @override
  void dispose() {}
}
