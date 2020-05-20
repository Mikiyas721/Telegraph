import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final Iterable<Contact> contacts;

  ContactList(Iterable<Contact> contacts) : contacts = contacts;

  @override
  Widget build(BuildContext context) {
    return ListView(children: ListTile.divideTiles(tiles: getTiles()).toList());
  }

  List<Widget> getTiles() {
    List<Widget> widgets = List<Widget>();
    for (Contact contact in contacts) {
      widgets.add(ListTile(
        leading: Image.asset('/assets/avatar_1.png'),
        title: Text(contact.displayName),
        subtitle: Text(contact.emails.toList()[0].toString()),
      ));
    }
  }
}
