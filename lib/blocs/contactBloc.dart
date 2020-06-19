import '../core/mixins/validator_mixin.dart';
import '../core/utils/disposable.dart';
import '../core/utils/preferenceKeys.dart';
import '../data/chatDataSource.dart';
import '../data/contactDatasource.dart';
import '../models/chat.dart';
import '../models/contact.dart';
import '../others/assistant.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get_it/get_it.dart';

class ContactBloc extends Disposable with ValidatorMixin {
  ContactListRepo get contactListRepo => GetIt.instance.get();

  ContactRepo get contactRepo => GetIt.instance.get();

  ChatRepo get chatRepo => GetIt.instance.get();

  void fetchFriendsWithAccount() async {
    List<Contact> contacts = await contactListRepo.getPhoneContacts();
    List<ContactModel> allApiContacts = await contactListRepo.getContacts();
    List<ContactModel> friendsWithAccount = List();
    for (Contact contact in contacts) {
      for (ContactModel api in allApiContacts) {
        if (contact.phones.toList().isNotEmpty &&
            contact.phones.toList()[0].toString() == api.phoneNumber) {
          friendsWithAccount.add(api);
          contactListRepo.setApiContact(friendsWithAccount);
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
    List<Contact> contacts = await contactListRepo.getPhoneContacts();
    List<ContactModel> contactModel = List();
    for (Contact contact in contacts) {
      contactModel.add(ContactModel(
          initials: contact.initials(),
          firstName: contact.givenName,
          phoneNumber: contact.phones.toList().isEmpty
              ? contact.displayName
              : contact.phones.toList()[0].toString()));
      contactListRepo.setPhoneContact(contactModel);

      //contactsBox.put('phone_contacts', contactModel);
    }
  }

  void fetchApiContacts() async {
    List<dynamic> allApiContacts = await contactListRepo.getApiContacts();
    List<ContactModel> apiAccounts = List();
    for (dynamic apiContact in allApiContacts) {
      dynamic user = await contactListRepo.getUserById(apiContact['userId']);
      if (user != null) {
        apiAccounts.add(ContactModel(
            phoneNumber: apiContact['phoneNumber'].toString(),
            firstName: apiContact['firstName'],
            lastName: apiContact['lastName'],
            userId: apiContact['userId'],
            lastSeen: user['lastSeen']));
      }
      contactListRepo.setApiContact(apiAccounts);
    }
  }

  void updateAccountValue(String value, String whichValue) {
    if (whichValue == "firstName") {
      contactListRepo.updateStream([
        ContactModel(
            firstName: value,
            lastName: contactListRepo.dataStream.value[0].lastName,
            phoneNumber: contactListRepo.dataStream.value[0].phoneNumber,
            countryCode: contactListRepo.dataStream.value[0].countryCode)
      ]);
    } else if (whichValue == "lastName") {
      contactListRepo.updateStream([
        ContactModel(
            firstName: contactListRepo.dataStream.value[0].firstName,
            lastName: value,
            phoneNumber: contactListRepo.dataStream.value[0].phoneNumber,
            countryCode: contactListRepo.dataStream.value[0].countryCode)
      ]);
    } else if (whichValue == "phoneNumber") {
      contactListRepo.updateStream([
        ContactModel(
            firstName: contactListRepo.dataStream.value[0].firstName,
            lastName: contactListRepo.dataStream.value[0].lastName,
            phoneNumber: value,
            countryCode: contactListRepo.dataStream.value[0].countryCode)
      ]);
    } else if (whichValue == "countryCode") {
      contactListRepo.updateStream([
        ContactModel(
            firstName: contactListRepo.dataStream.value[0].firstName,
            lastName: contactListRepo.dataStream.value[0].lastName,
            phoneNumber: contactListRepo.dataStream.value[0].phoneNumber,
            countryCode: value)
      ]);
    }
  }

  Future<bool> addAccount() async {
    ContactModel contact = contactListRepo.dataStream.value[0];
    if (validatePhone(contact.phoneNumber) == null &&
        contact.firstName.length > 1) {
      return await contactListRepo.postContact(contact);
    } else {
      return false;
    }
  }

  onContactItemClicked(String firstName, String lastName, String lastSeen,
      String secondPersonId) {
    contactRepo.updateStream(ContactModel(
        firstName: firstName, lastName: lastName, lastSeen: lastSeen));
    dynamic chat = contactListRepo.getChatOfUsers(
        contactListRepo.getPreference(PreferenceKeys.userAPIId),
        secondPersonId);
    chatRepo.updateStream(ChatModel(chatId: chat == null ? null : chat['id']));
  }

  @override
  void dispose() {}
}
