import 'package:Telegraph/core/mixins/validator_mixin.dart';
import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get_it/get_it.dart';

class ContactBloc extends Disposable with ValidatorMixin {
  ContactRepo get contactRepo => GetIt.instance.get();

  void fetchFriendsWithAccount() async {
    List<Contact> contacts = await contactRepo.getPhoneContacts();
    List<ContactModel> allApiContacts = await contactRepo.getContacts();
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
    List<Map<String, dynamic>> allApiContacts =
        await contactRepo.getApiContacts();
    List<ContactModel> apiAccounts = List();
    for (Map<String, dynamic> apiContact in allApiContacts) {
      Map<String, dynamic> user =
          await contactRepo.getUserById(apiContact['userId']);
      apiAccounts.add(ContactModel(
          phoneNumber: apiContact['phoneNumber'],
          firstName: apiContact['firstName'],
          lastName: apiContact['lastName'],
          userId: apiContact['userId'],
          lastSeen: user['lastSeen']));
      contactRepo.setApiContact(apiAccounts);
    }
  }

  void updateAccountValue(String value, String whichValue) {
    if (whichValue == "firstName") {
      contactRepo.updateStream([
        ContactModel(
            firstName: value,
            lastName: contactRepo.dataStream.value[0].lastName,
            phoneNumber: contactRepo.dataStream.value[0].phoneNumber,
            countryCode: contactRepo.dataStream.value[0].countryCode)
      ]);
    } else if (whichValue == "lastName") {
      contactRepo.updateStream([
        ContactModel(
            firstName: contactRepo.dataStream.value[0].firstName,
            lastName: value,
            phoneNumber: contactRepo.dataStream.value[0].phoneNumber,
            countryCode: contactRepo.dataStream.value[0].countryCode)
      ]);
    } else if (whichValue == "phoneNumber") {
      contactRepo.updateStream([
        ContactModel(
            firstName: contactRepo.dataStream.value[0].firstName,
            lastName: contactRepo.dataStream.value[0].lastName,
            phoneNumber: value,
            countryCode: contactRepo.dataStream.value[0].countryCode)
      ]);
    } else if (whichValue == "countryCode") {
      contactRepo.updateStream([
        ContactModel(
            firstName: contactRepo.dataStream.value[0].firstName,
            lastName: contactRepo.dataStream.value[0].lastName,
            phoneNumber: contactRepo.dataStream.value[0].phoneNumber,
            countryCode: value)
      ]);
    }
  }

  Future<bool> addAccount() async {
    ContactModel contact = contactRepo.dataStream.value[0];
    if (validatePhone(contact.phoneNumber) == null &&
        contact.firstName.length > 1) {
      return await contactRepo.postContact(contact);
    }else{
      return false;
    }
  }

  @override
  void dispose() {}
}
