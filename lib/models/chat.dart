
import 'package:Telegraph/others/chatType.dart';

class ChatModel {
  List<String> _usersId;
  String _title;
  String _chatImageURL;
  ChatType _chatType;
  String _id;

  @override
  String toString() {
    return '''{
      "usersid": "$_usersId",
      "chattype": "$_chatType",
      "imageurl": ${_chatImageURL.toString()},
      "title": "$_title",
    }''';
  }

  ChatModel(
      this._usersId, this._title, this._chatImageURL, this._chatType, this._id);

  List<String> get getUsers => _usersId;

  String get getTitle => _title;

  String get getImageURL => _chatImageURL;

  ChatType get getChatType => _chatType;

  String get getId => _id;

  set title(String title) => _title = title;

  set chatImageURL(String url) => _chatImageURL = url;

  set chatType(ChatType chatType) => _chatType = chatType;

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    if (ChatTypeMethods.getChatType(json['chattype']) == ChatType.SINGLE) {
      //TODO parse title and imageurl from the secondUser
      return ChatModel(json['usersid'], json['title'], json['imageUrl'],
          ChatType.SINGLE, json['id']);
    } else {
      return ChatModel(json['usersid'], json['title'], json['imageUrl'],
          ChatTypeMethods.getChatType(json['chattype']), json['id']);
    }
  }
}
