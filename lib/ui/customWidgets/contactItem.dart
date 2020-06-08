import 'package:Telegraph/ui/customWidgets/circularContainer.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String lastSeen;

  ContactItem({this.imageUrl, this.userName, this.lastSeen});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MyImageView(imageURL: imageUrl),
      title: Text(
        '$userName',
        style: Theme.of(context).textTheme.subtitle,
      ),
      subtitle: Text(
        '$lastSeen',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
