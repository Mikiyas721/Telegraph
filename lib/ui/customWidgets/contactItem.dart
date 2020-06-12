import 'package:Telegraph/ui/customWidgets/circularContainer.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String imageUrl;
  final String avatarText;
  final String userName;
  final String lastSeen;
  final void Function() onTap;

  ContactItem(
      {this.imageUrl, this.avatarText = "", this.userName, this.lastSeen, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        child: Text(avatarText),
      ),
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
