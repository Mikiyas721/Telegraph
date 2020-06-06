import 'package:Telegraph/blocs/callBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/models/call.dart';
import 'package:Telegraph/ui/customWidgets/callItem.dart';
import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CallBloc>(
        blocFactory: () => CallBloc(),
        builder: (BuildContext context, CallBloc bloc) {
          bloc.fetchCalls("5ed80b1c0eeda33bc4b2f2ad");//TODO replace by an actual Id of the user
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
                  }),
              title: Text(
                "Calls",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            body: StreamBuilder<List<CallModel>>(
                stream: bloc.callRepo.callStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<CallModel>> snapShot) {
                  if (!snapShot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapShot.data.isEmpty) {
                      return Center(
                          child: Text(
                        "You haven't made any calls yet",
                        style: Theme.of(context).textTheme.body2,
                      ));
                    }
                    return ListView.separated(
                        itemCount: snapShot.data.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(color: Theme.of(context).dividerColor,);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CallItem(
                            imageUrl: 'assets/avatar_1.png',
                            title: snapShot.data[index].userName,
                            callType: snapShot.data[index].callType,
                            callTime: snapShot.data[index].dateTime,
                          );
                        },);
                  }
                }),
          );
        });
  }
}
