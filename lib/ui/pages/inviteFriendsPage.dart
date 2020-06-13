import 'package:Telegraph/blocs/contactBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/ui/customWidgets/contactItem.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InviteFriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      blocFactory: () => ContactBloc(),
      builder: (BuildContext context, ContactBloc bloc) {
        bloc.fetchPhoneContacts();
        final scroll = ScrollController();
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text('Invite Friends')),
          body: StreamBuilder<List<ContactModel>>(
            stream: bloc.contactListRepo.phoneContactStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<ContactModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data.isEmpty) {
                  return Center(
                      child: Text('You have no contacts in your phone'));
                }
                return DraggableScrollbar.arrows(
                    backgroundColor: Theme.of(context).textTheme.title.color,
                    controller: scroll,
                    child: ListView.builder(
                      controller: scroll,
                      itemBuilder: (BuildContext context, int index) {
                        return ContactItem(
                          avatarText: snapshot.data[index].initials,
                          userName: snapshot.data[index].firstName,
                          lastSeen: snapshot.data[index].phoneNumber,
                        );
                      },
                      itemCount: snapshot.data.length,
                    ));
              }
            },
          ),
        );
      },
    );
  }
}
