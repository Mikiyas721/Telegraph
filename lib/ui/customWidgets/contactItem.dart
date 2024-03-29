import '../../ui/customWidgets/circularContainer.dart';
import '../../ui/customWidgets/myImageView.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String imageUrl;
  final String avatarText;
  final String userName;
  final String lastSeen;
  final void Function() onTap;

  ContactItem(
      {this.imageUrl,
      this.avatarText = "",
      this.userName,
      this.lastSeen,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: imageUrl == null
          ? CircleAvatar(
              child: Text(
                avatarText,
                style: Theme.of(context).textTheme.body2,
              ),
            )
          : CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
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
