import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/setting/chatBackgroundBloc.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:flutter/material.dart';

class ChatBackgroundPage extends StatelessWidget {
  final defaultUrl = "assets/chatBackground_8.jpeg";
  final List<String> imagesUrl = [
    "assets/chatBackground_8.jpeg",
    "assets/chatBackground_7.jpeg",
    "assets/chatBackground_6.jpeg",
    "assets/chatBackground_5.jpeg",
    "assets/chatBackground_4.jpeg",
    "assets/chatBackground_3.jpeg",
    "assets/chatBackground_2.png",
    "assets/chatBackground_1.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBackgroundBloc>(
        blocFactory: () => ChatBackgroundBloc(),
        builder: (BuildContext context, ChatBackgroundBloc bloc) {
          bloc.setChatBackground(PreferenceKeys.getPreference(PreferenceKeys.chatBackground));
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
                  "Chat Background",
                  style: Theme.of(context).textTheme.title,
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {})
                ],
              ),
              body: StreamBuilder(
                  stream: bloc.chatBackground,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(snapshot.data == null
                                  ? defaultUrl
                                  : snapshot.data),
                              fit: BoxFit.cover)),
                    );
                  }),
              bottomSheet: StreamBuilder(
                  stream: bloc.chatBackground,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(snapshot.data == null
                                  ? defaultUrl
                                  : snapshot.data),
                              fit: BoxFit.cover)),
                      height: 100,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: getImages(bloc)),
                    );
                  }));
        });
  }

  List<Widget> getImages(ChatBackgroundBloc bloc) {
    List<GestureDetector> images = List<GestureDetector>();
    for (String url in imagesUrl) {
      images.add(
        GestureDetector(
          child: Image.asset(
            url,
            width: 50,
          ),
          onTap: () {
            bloc.setChatBackground(url);
          },
        ),
      );
    }
    return images;
  }
}
