import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactBloc extends Disposable {
  ContactRepo get contactRepo => GetIt.instance.get();

  void getContact() async {
    try {
      List<ContactModel> contacts = await contactRepo.getPhoneContacts();
      contactRepo.setContacts(contacts);
    } catch (Exception) {
      if (Exception.toString() == "Permission Denied") {
        Map<Permission, PermissionStatus> status = await Assistant.getPermissions();
        if (status['contacts'] == PermissionStatus.granted) {
          List<ContactModel> contacts = await contactRepo.getPhoneContacts();
          contactRepo.setContacts(contacts);
        }
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
