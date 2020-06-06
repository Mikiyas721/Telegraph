import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/data/http.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:contacts_service/contacts_service.dart';
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

  Stream<List<ContactModel>> get contactStream =>
      items.map((contact) => contact);

  Function(List<ContactModel>) get setContacts => items.add;

  Future<List<ContactModel>> getPhoneContacts() async {
    List<ContactModel> contactsList = List<ContactModel>();
    Iterable<Contact> contacts;
    try {
      contacts = await ContactsService.getContacts();
      contacts = contacts.toList();
      if (contacts != null) {
        contacts.forEach((contact) async {
          Iterable<Item> numbers = contact.phones;
          numbers = numbers.toList();
          for (Item number in numbers) {
            dynamic user = await Http.getUserByNumber(number.value);
            if (user!={}) {
              contactsList.add(ContactModel(
                key: number.value,
                firstName: contact.givenName,
                lastName: contact.displayName,
                lastSeen: user['lastSeen']
              ));
              break;
            }
          }
        });
        //write these contacts to phone
        //ContactsService.addContact();
      }
    } catch (error) {
      throw Exception("Permission Denied");
    }
    return contactsList;
  }

  Future<List<ContactModel>> getApiContacts(String userId) async {
    List<dynamic> apiRecordedContacts = await Http.getContactsForUser(userId);
    List<ContactModel> contactsList = List();
    if (apiRecordedContacts != null) {
      apiRecordedContacts.forEach((contactMap) {
        contactsList.add(ContactModel(
          key: contactMap['phoneNumber'],
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
