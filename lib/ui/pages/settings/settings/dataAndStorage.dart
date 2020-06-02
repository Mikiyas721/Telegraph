import 'package:Telegraph/blocs/customWidgetBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/setting/storageBloc.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';

class DataAndStoragePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StorageBloc>(
        blocFactory: () => StorageBloc(),
        builder: (BuildContext context, StorageBloc bloc) {
          bloc.setWhenOnData(
              PreferenceKeys.getPreference(PreferenceKeys.onMobileData));
          bloc.setWhenOnWifi(
              PreferenceKeys.getPreference(PreferenceKeys.onWifi));
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
                "Data and Storage",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            body: ListView(
              children: <Widget>[
                SettingGroupTitle(
                  "Automatic Media download",
                  false,
                  top: 15,
                  left: 15,
                ),
                StreamBuilder(
                    stream: bloc.whenOnDataStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListTile(
                        title: Text("When using mobile data",
                            style: Theme.of(context).textTheme.body2),
                        subtitle: Text(
                          "${snapshot.data}",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) => getBottomSheet(
                                  bloc.setWhenOnData,
                                  bloc.whenOnDataStream.value == null
                                      ? []
                                      : bloc.whenOnDataStream.value.split(", "),
                                  PreferenceKeys.setPreference,PreferenceKeys.onMobileData));
                        },
                      );
                    }),
                StreamBuilder(
                    stream: bloc.whenOnWifiStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListTile(
                        title: Text("When connected to Wi-Fi",
                            style: Theme.of(context).textTheme.body2),
                        subtitle: Text(
                          "${snapshot.data}",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) => getBottomSheet(
                                  bloc.setWhenOnWifi,
                                  bloc.whenOnWifiStream.value == null
                                      ? []
                                      : bloc.whenOnWifiStream.value.split(", "),
                                  PreferenceKeys.setPreference, PreferenceKeys.onWifi));
                        },
                      );
                    })
              ],
            ),
          );
        });
  }

  Widget getBottomSheet(Function(String) parentSink, List<String> selected,
      sharedPreferenceSink, String key) {
    return BlocProvider<CustomWidgetBloc>(
        blocFactory: () => CustomWidgetBloc(),
        builder: (BuildContext context, CustomWidgetBloc bloc) {
          for (String select in selected) {
            if (select == "Photo")
              bloc.setPhoto(true);
            else if (select == "Video Message")
              bloc.setVideoMessage(true);
            else if (select == "Video")
              bloc.setVideo(true);
            else if (select == "File")
              bloc.setFile(true);
            else if (select == "Music")
              bloc.setMusic(true);
            else if (select == "GIF") bloc.setGif(true);
          }
          return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: <Widget>[
                  StreamBuilder(
                    stream: bloc.photoStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text("Photos", style: Theme.of(context).textTheme.body2),
                        value: snapshot.data == null ? false : snapshot.data,
                        onChanged: bloc.setPhoto,
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: bloc.videoMessageStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text("Voice Messages",
                            style: Theme.of(context).textTheme.body2),
                        value: snapshot.data == null ? false : snapshot.data,
                        onChanged: bloc.setVideoMessage,
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: bloc.videoStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text("Video", style: Theme.of(context).textTheme.body2),
                        value: snapshot.data == null ? false : snapshot.data,
                        onChanged: bloc.setVideo,
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: bloc.fileStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text("Files", style: Theme.of(context).textTheme.body2),
                        value: snapshot.data == null ? false : snapshot.data,
                        onChanged: bloc.setFile,
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: bloc.musicStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text("Music", style: Theme.of(context).textTheme.body2),
                        value: snapshot.data == null ? false : snapshot.data,
                        onChanged: bloc.setMusic,
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: bloc.gifStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text("GIFs", style: Theme.of(context).textTheme.body2),
                        value: snapshot.data == null ? false : snapshot.data,
                        onChanged: bloc.setGif,
                      );
                    },
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            String selectedMedia = '';
                            if (bloc.photoStream.value == true)
                              selectedMedia += "Photo, ";
                            if (bloc.videoMessageStream.value == true)
                              selectedMedia += "Voice Message, ";
                            if (bloc.videoStream.value == true)
                              selectedMedia += "Video, ";
                            if (bloc.fileStream.value == true)
                              selectedMedia += "File, ";
                            if (bloc.musicStream.value == true)
                              selectedMedia += "Music, ";
                            if (bloc.gifStream.value == true)
                              selectedMedia += "GIF, ";
                            if (selectedMedia == '') selectedMedia = "No Media";
                            parentSink(selectedMedia);
                            sharedPreferenceSink<String>(key,selectedMedia);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "  SAVE  ",
                            style: TextStyle(
                                color: Theme.of(context).textTheme.button.color,
                                backgroundColor: Theme.of(context).buttonColor),
                          )))
                ],
              ));
        });
  }
}
