import 'package:telegraph/models/chatType.dart';

class ChatDisplay {
  String _title;
  String _lastChatText;
  String _chatImageURL;
  ChatType _chatType;

  ChatDisplay(
      this._chatImageURL, this._chatType, this._title, this._lastChatText);

  String get getTitle => _title;

  String get getLastChatText => _lastChatText;

  String get getImageURL => _chatImageURL;

  ChatType get getChatType => _chatType;

  set title(String title) => _title = title;
  set lastChatText(String lastChatText) => _lastChatText = lastChatText;
  set chatImageURL(String url) => _chatImageURL = url;
  set chatType(ChatType chatType) => _chatType = chatType;
}
