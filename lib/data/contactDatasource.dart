import 'package:Telegraph/core/jsonModel.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/data/mixin/http.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class ContactListRepo extends ListRepo<ContactModel> with Http{
  ContactListRepo(BehaviorSubject<List<JSONModel>> subject) : super(subject);

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

  Future<List<dynamic>> getApiContacts() async {
    String userId = getPreference<String>(PreferenceKeys.userAPIId);
    Response chat =
    await dio.get('$apiBasePath/contacts?filter[where][userId]=$userId');
    return chat.data;
  }

   Future<List<ContactModel>> getContacts() async {
    List<dynamic> apiRecordedContacts = await getAllContacts();
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

  Future<bool> postContact(ContactModel contactModel) async {
    Response response  = await addContact(contactModel);
    if(response.statusCode==200) return true;
    return false;
  }
}
class ContactRepo extends ItemRepo<ContactModel>{
  ContactRepo(BehaviorSubject<ContactModel> subject) : super(subject);
}
