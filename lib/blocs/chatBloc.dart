import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/data/chatDataSource.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:get_it/get_it.dart';

class ChatBloc extends Disposable {
  ChatRepo chatRepo = GetIt.instance.get();

  void fetchChats() async {
    List<ChatModel> data = await chatRepo.getChatModel(
        userId: chatRepo.getPreference<String>(PreferenceKeys.userAPIId));
    chatRepo.setChat(data);
  }

  @override
  void dispose() {}
}
