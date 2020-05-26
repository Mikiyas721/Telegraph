import 'package:Telegraph/controll/blocs/customWidgetBloc.dart';
import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/storageBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';

class DataAndStorage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StorageBloc>(
        blocFactory: () => StorageBloc(),
        builder: (BuildContext context, StorageBloc bloc) {
          final instance = SharedPreferenceHandler.getInstance();
          instance
              .getMediaDownloadOnData()
              .then((newValue) => bloc.setWhenOnData(newValue));
          instance
              .getMediaDownloadOnWifi()
              .then((newValue) => bloc.setWhenOnWifi(newValue));
          return MaterialApp(
            title: "Data and Storage",
            home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(
                  "Data and Storage",
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                          title: Text("When using mobile data"),
                          subtitle: Text(
                            "${snapshot.data}",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    getBottomSheet(
                                        bloc.setWhenOnData,
                                        bloc.whenOnDataStream.value == null
                                            ? []
                                            : bloc.whenOnDataStream.value
                                                .split(", "),SharedPreferenceHandler.getInstance().setMediaDownloadOnData));
                          },
                        );
                      }),
                  StreamBuilder(
                      stream: bloc.whenOnWifiStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListTile(
                          title: Text("When connected to Wi-Fi"),
                          subtitle: Text(
                            "${snapshot.data}",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    getBottomSheet(
                                        bloc.setWhenOnWifi,
                                        bloc.whenOnWifiStream.value == null
                                            ? []
                                            : bloc.whenOnWifiStream.value
                                                .split(", "),SharedPreferenceHandler.getInstance().setMediaDownloadOnWifi));
                          },
                        );
                      })
                ],
              ),
            ),
          );
        });
  }

  Widget getBottomSheet(Function(String) parentSink, List<String> selected,Future<bool> Function(String) sharedPreferenceSink) {
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
          return Column(
            children: <Widget>[
              StreamBuilder(
                stream: bloc.photoStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return CheckboxListTile(
                    dense: true,
                    title: Text("Photos"),
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
                    title: Text("Video Messages"),
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
                    title: Text("Video"),
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
                    title: Text("Files"),
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
                    title: Text("Music"),
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
                    title: Text("GIFs"),
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
                          selectedMedia += "Video Message, ";
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
                        sharedPreferenceSink(selectedMedia);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            color: Colors.white70,
                            backgroundColor: Colors.blue),
                      )))
            ],
          );
        });
  }
}
