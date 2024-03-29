import '../../blocs/contactBloc.dart';
import '../../blocs/provider/provider.dart';
import '../../core/mixins/date_formatter.dart';
import '../../models/contact.dart';
import '../../ui/customWidgets/contactItem.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget with FormatterMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      blocFactory: () => ContactBloc(),
      builder: (BuildContext context, ContactBloc bloc) {
        bloc.fetchApiContacts();
        return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Contacts",
                style: Theme.of(context).textTheme.title,
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/newContactPage');
                    })
              ],
            ),
            body: StreamBuilder(
                stream: bloc.contactListRepo.phoneContactStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ContactModel>> snapShot) {
                  if (!snapShot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapShot.data.isEmpty) {
                      return Center(
                          child: Text(
                        "None of your contacts have Telegraph",
                        style: Theme.of(context).textTheme.body2,
                      ));
                    }
                    final controller = ScrollController();
                    return DraggableScrollbar.arrows(
                        controller: controller,
                        child: ListView.builder(
                          controller: controller,
                          itemCount: snapShot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ContactItem(
                              imageUrl: 'assets/avatar_1.png',
                              userName: snapShot.data[index].firstName,
                              lastSeen: formatLog(
                                  getDateTime(snapShot.data[index].lastSeen)),
                              onTap: () {
                                ContactModel contact = snapShot.data[index];
                                bloc.onContactItemClicked(contact.firstName,
                                    contact.lastName, contact.lastSeen, contact.id);
                                Navigator.pushNamed(context, '/chattingPage');
                              },
                            );
                          },
                        ));
                  }
                }));
      },
    );
  }
}
