import 'package:flutter/material.dart';

class ChatBackground extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatBackgroundState();
  }
}

class ChatBackgroundState extends State<ChatBackground> {
  String selectedImageUrl = "assets/chatBackground_8.jpeg";
  List<String> imagesUrl = [
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
    return MaterialApp(
      title: "Chat Background",
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
              "Chat Background",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  onPressed: () {})
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(selectedImageUrl), fit: BoxFit.cover)),
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(selectedImageUrl), fit: BoxFit.cover)),
            height: 100,
            child: ListView(
                scrollDirection: Axis.horizontal, children: getImages()),
          )),
    );
  }

  List<Widget> getImages() {
    List<Padding> images = List<Padding>();
    for (String url in imagesUrl) {
      images.add(Padding(
        /*padding: EdgeInsets.all(5),*/
        child: GestureDetector(
          child: Image.asset(url,width: 50,),
          onTap: () {
            setState(() {
              selectedImageUrl = url;
            });
          },
        ),
      ));
    }
    return images;
  }
}
