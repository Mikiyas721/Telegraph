import 'dart:async';
import '../core/jsonModel.dart';
import '../core/repository.dart';
import '../data/mixin/http.dart';
import '../models/chat.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';

class ChatListRepo extends ListRepo<ChatModel> with Http{
  ChatListRepo(BehaviorSubject<List<JSONModel>> subject) : super(subject);


  Stream<List<ChatModel>> get chatStream => dataStream.map((chat) => chat);

  FutureOr<List<ChatModel>> getChatModel({String userId}) async {
    List<dynamic> responseList = await getChatsForUser(userId);
    if(responseList!=null&&responseList.isEmpty) return [];
    else if (responseList!=null&&responseList.isNotEmpty) {
      List<ChatModel> chatModelList = List();

      responseList.forEach((chat) async {
        ChatType chatType = ChatTypeMethods.getChatType(chat['chattype']);
        String title;
        if (chatType != ChatType.SINGLE)
          title = chat['title'];
        else {
          dynamic secondUser;
          for (String id in chat['usersid'])
            if (id != userId) {
              secondUser = await getUserById(id);
            }
          secondUser['lastName'] == null
              ? title = secondUser['firstName']
              : title = secondUser['firstName'] + " " + secondUser['lastName'];
        }
        String lastChatString = "Hi, How are you";
        DateTime lastMessageDateTime = DateTime.now();
        chatModelList.add(ChatModel(
            chatImageUrl: 'assets/avatar_1.png',
            lastChatString: lastChatString,
            lastMessageTime: lastMessageDateTime,
            chatType: chatType,
            chatTitle: title));
      });
      return chatModelList;
    }
    return [null];
  }

  Function(List<ChatModel> chatModel) get setChat => dataStream.add;
}
class ChatRepo extends ItemRepo<ChatModel>{
  ChatRepo(BehaviorSubject<ChatModel> subject) : super(subject);

}

