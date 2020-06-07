import 'package:Telegraph/core/jsonModel.dart';

class ChatModel extends JSONModel {
  final String chatImageUrl;
  final String chatTitle;
  final String lastChatString;
  final ChatType chatType;
  final DateTime lastMessageTime;

  ChatModel(
      {this.chatImageUrl,
      this.chatTitle,
      this.lastChatString,
      this.chatType,
      this.lastMessageTime})
      : super(chatTitle);

  @override
  Map<String, dynamic> toMap() {
    return {
      'chatImageUrl': chatImageUrl,
      'chatTitle': chatTitle,
      'lastChatString': lastChatString,
      'chatType': chatType,
      'chatTime': lastMessageTime,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
        chatImageUrl: map['chatImageUrl'],
        chatTitle: map['chatTitle'],
        lastChatString: map['lastChatString'],
        chatType: map['chatType'],
        lastMessageTime: map['chatTime']);
  }
}

enum ChatType { CHANNEL, GROUP, BOT, SINGLE }

class ChatTypeMethods {
  static ChatType getChatType(String chatType) {
    if (chatType == 'channel')
      return ChatType.CHANNEL;
    else if (chatType == 'group')
      return ChatType.GROUP;
    else if (chatType == 'bot')
      return ChatType.BOT;
    else
      return ChatType.SINGLE;
  }
}
