import 'dart:async';
import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/core/restClient.dart';
import 'package:Telegraph/data/http.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChatDataSource extends CRUDListSource<ChatModel> {

}

class CacheChatDataSource extends CacheCRUDListSource<ChatModel>
    implements ChatDataSource {
  CacheChatDataSource(SharedPreferences preference)
      : super(preference, 'chat', (call) => ChatModel.fromMap(call));
}
class ChatRemoteDataSource extends RemoteCRUDSource<ChatModel> implements ChatDataSource{
  ChatRemoteDataSource(RestClient client) : super(client, '', (map)=>ChatModel.fromMap(map));

}

class ChatRepo extends ListRepo<ChatModel, ChatDataSource> {
  ChatRepo(String key) : super(key);

  Stream<List<ChatModel>> get chatStream => items.map((chat) => chat);

  FutureOr<List<ChatModel>> getChatModel({String userId}) async {
    List<dynamic> responseList = await Http.getChatsForUser(userId);
    if (responseList.isNotEmpty) {
      List<ChatModel> chatModelList = List();
      for (Map<String, dynamic> chat in responseList) {
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
      }
      return chatModelList;
    }
    return [];
  }

  Function(List<ChatModel> chatModel) get setChat => items.add;
}
