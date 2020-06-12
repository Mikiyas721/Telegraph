import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/data/chatDataSource.dart';
import 'package:Telegraph/data/messageDataSource.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dash_chat/dash_chat.dart';

class ChatBloc extends Disposable {
  ChatRepo chatRepo = GetIt.instance.get();
  MessageRepo messageRepo = GetIt.instance.get();
  final chatMessageRepo = BehaviorSubject<List<ChatMessage>>();

  Stream<List<ChatMessage>> get messagesStream =>
      chatMessageRepo.map((List<ChatMessage> chatMessage) => chatMessage);

  Function(List<ChatMessage> chatMessage) get setMessageStream =>
      chatMessageRepo.add;

  void fetchChats() async {
    List<ChatModel> data = await chatRepo.getChatModel(
        userId: chatRepo.getPreference<String>(PreferenceKeys.userAPIId));
    chatRepo.setChat(data);
  }

  void getChatMessage(String chatId) async {
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

  @override
  void dispose() {
    chatMessageRepo.close();
  }
}
