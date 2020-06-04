import 'dart:async';
import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/data/http.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatDataSource extends CRUDListSource<ChatModel> {
  @override
  Future<int> count({where, bool forceRefresh}) {
    // TODO: implement count
    return null;
  }

  @override
  FutureOr<ChatModel> create(ChatModel t) {
    // TODO: implement create
    return null;
  }

  @override
  FutureOr<void> delete(String id) {
    // TODO: implement delete
    return null;
  }

  @override
  FutureOr<void> deleteAll() {
    // TODO: implement deleteAll
    return null;
  }

  @override
  FutureOr<List<ChatModel>> get({filter, bool forceRefresh}) async {
    List<dynamic> responseList = await Http.getChatsForUser(filter);
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
            if (id != filter) {
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

  @override
  FutureOr<ChatModel> getById(String id, {filter, bool forceRefresh}) {
    // TODO: implement getById
    return null;
  }

  @override
  FutureOr<ChatModel> update(ChatModel t) {
    // TODO: implement update
    return null;
  }
}

class CacheChatDataSource extends CacheCRUDListSource<ChatModel>
    implements ChatDataSource {
  CacheChatDataSource(SharedPreferences preference)
      : super(preference, 'chat', (call) => ChatModel.fromMap(call));
}

class ChatRepo extends ListRepo<ChatModel, ChatDataSource> {
  ChatRepo(String key) : super(key);

  Stream<List<ChatModel>> get chatStream => items.map((chat) => chat);

  Function(List<ChatModel> chatModel) get setChat => items.add;
}
