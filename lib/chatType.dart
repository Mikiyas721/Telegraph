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
