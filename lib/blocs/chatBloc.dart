import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/data/chatDataSource.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:Telegraph/data/messageDataSource.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dash_chat/dash_chat.dart';

class ChatBloc extends Disposable {
  ChatListRepo chatListRepo = GetIt.instance.get();
  ChatRepo chatRepo = GetIt.instance.get();
  MessageRepo messageRepo = GetIt.instance.get();
  ContactRepo contactRepo = GetIt.instance.get();
  final chatMessageRepo = BehaviorSubject<List<ChatMessage>>();

  Stream<List<ChatMessage>> get messagesStream =>
      chatMessageRepo.map((List<ChatMessage> chatMessage) => chatMessage);

  Function(List<ChatMessage> chatMessage) get setMessageStream =>
      chatMessageRepo.add;

  void fetchChats() async {
    List<ChatModel> data = await chatListRepo.getChatModel(
        userId: chatListRepo.getPreference<String>(PreferenceKeys.userAPIId));
    chatListRepo.setChat(data);
  }

  void fetchChatMessages(String chatId) async {
    if (chatId != null) {
      List<Map<String, dynamic>> messagesOfChat =
          await messageRepo.getMessagesOfChat(chatId);
      List<ChatMessage> chatMessages = List();
      messagesOfChat.forEach((Map<String, dynamic> message) async {
        Map<String, dynamic> sender =
            await messageRepo.getUserById(message['senderId']);
        chatMessages.add(ChatMessage(
          text: message['messageText'],
          user: ChatUser(name: sender['firstName']),
        ));
        setMessageStream(chatMessages);
      });
    }
  }

  void updateContactFromChat(String chatId) async {
    dynamic chat = await chatListRepo.getChat(chatId);
    String secondUserId;
    for (String id in chat['usersid']) {
      if (id != chatListRepo.getPreference<String>(PreferenceKeys.userAPIId))
        secondUserId = id;
    }
    dynamic user = await chatListRepo.getUserById(secondUserId);
    List<String> numberSplit = user['phoneNumber'].split(' ');
    contactRepo.updateStream(ContactModel(
        firstName: user['firstName'],
        lastName: user['lastName'],
        lastSeen: user['lastSeen'],
        phoneNumber: numberSplit[1],
        countryCode: numberSplit[0]));
  }

  /*List<String> splitNumber(String phoneNumber){
    return phoneNumber.split(' ');
  }*/

  @override
  void dispose() {
    chatMessageRepo.close();
  }
}
