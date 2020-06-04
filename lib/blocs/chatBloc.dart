import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/chatDataSource.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:get_it/get_it.dart';

class ChatBloc extends Disposable{
  ChatRepo chatRepo = GetIt.instance.get();

  void fetchChats(String userId)async{
    List<ChatModel> data = await chatRepo.get(filter: userId);
    chatRepo.setChat(data);
  }
  @override
  void dispose() {
  }

}