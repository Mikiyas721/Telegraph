import 'dart:async';
import 'package:Telegraph/core/jsonModel.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/data/http.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';

class ChatRepo extends ListRepo {
  ChatRepo(BehaviorSubject<List<JSONModel>> subject) : super(subject);


  Stream<List<ChatModel>> get chatStream => dataStream.map((chat) => chat);

  FutureOr<List<ChatModel>> getChatModel({String userId}) async {
    List<dynamic> responseList = await Http.getChatsForUser(userId);
    if (responseList!=null&&responseList.isNotEmpty) {
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
              secondUser = await Http.getUserById(id);
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
