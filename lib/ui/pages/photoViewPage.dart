import '../../blocs/photoViewBloc.dart';
import '../../blocs/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoViewBloc>(
        blocFactory: () => PhotoViewBloc(),
        builder: (BuildContext context, PhotoViewBloc bloc) {
          return Scaffold(
              backgroundColor: Colors.black,
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
                  "1 of 1",
                  style: Theme.of(context).textTheme.title,
                ),
                actions: <Widget>[
                  PopupMenuButton(
                    color: Theme.of(context).backgroundColor,
                    onSelected: (selectedValue) {
                      if (selectedValue == 1) {}
                    },
                    itemBuilder: (context) {
                      return getMenu(context);
                    },
                  )
                ],
              ),
              body: Container(
                margin: EdgeInsets.only(top: 5),
                color: Colors.black,
                child: StreamBuilder(
                    builder: (BuildContext context, AsyncSnapshot snapShot) {
                  return PhotoView(
                      imageProvider: AssetImage(snapShot.data == null
                          ? (bloc.photoViewStream.value == null
                              ? 'assets/avatar_1.png'
                              : bloc.photoViewStream.value)
                          : snapShot.data));
                }),
                height: (MediaQuery.of(context).size.height) * 0.72,
              ),
              floatingActionButton: Opacity(
                opacity: 1,
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {},
                  child: Opacity(
                    opacity: 1,
                    child: Icon(Icons.share),
                  ),
                ),
              ));
        });
  }

  List<PopupMenuEntry> getMenu(BuildContext context) {
    List<String> menuListString = [
      'Save to gallery',
    ];
    List<PopupMenuEntry> menuList = [];
    int i = 0;
    for (String menu in menuListString) {
      menuList.add(new PopupMenuItem(
          value: i,
          child: Text(
            menu,
            style: Theme.of(context).textTheme.caption,
          )));
      i++;
    }
    return menuList;
  }
}
