import 'package:Telegraph/core/jsonModel.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/data/http.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hive/hive.dart';

class ContactRepo extends ListRepo {
  ContactRepo(BehaviorSubject<List<JSONModel>> subject) : super(subject);

  Stream<List<ContactModel>> get phoneContactStream =>
      getStream((contact) => contact);

  Function(List<ContactModel>) get setPhoneContact => dataStream.add;

  Stream<List<ContactModel>> get apiContactStream =>
      getStream((contact) => contact);

  Function(List<ContactModel>) get setApiContact => dataStream.add;

  Future<List<Contact>> getPhoneContacts() async {
    Iterable<Contact> fetched = await ContactsService.getContacts();
    return fetched.toList();
  }

  Future<List<ContactModel>> getApiContacts() async {
    List<dynamic> apiRecordedContacts = await Http.getContactsForUser(
        getPreference<String>(PreferenceKeys.userAPIId));
    List<ContactModel> contactsList = List();
    if (apiRecordedContacts != null) {
      apiRecordedContacts.forEach((contactMap) {
        contactsList.add(ContactModel(
          phoneNumber: contactMap['phoneNumber'],
          firstName: contactMap['firstName'],
          lastName: contactMap['lastName'],
        ));
      });
    }
    return contactsList;
  }

  Future<List<ContactModel>> getAllContacts() async {
    List<dynamic> apiRecordedContacts = await Http.getAllContacts();
    List<ContactModel> contactsList = List();
    if (apiRecordedContacts != null) {
      apiRecordedContacts.forEach((contactMap) {
        contactsList.add(ContactModel(
          phoneNumber: contactMap['phoneNumber'],
          firstName: contactMap['firstName'],
          lastName: contactMap['lastName'],
        ));
      });
    }
    return contactsList;
  }

  Future<dynamic> postContact(ContactModel contactModel) async {
    await Http.addContact(contactModel);
  }
}
