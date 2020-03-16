import 'dart:convert';
import 'Package:http/http.dart' as http;
import 'package:telegraph/models/chat.dart';

class Http {
  void getChatsForUser(String userId) async {}

  static Future<Map<String, dynamic>> getMessages(String chatId) async {
    String messages =
        await http.read('http://localhost:3000/api/messages/$chatId');
    return json.decode(messages);
  }

  static Future<Map<String, dynamic>> getMessagesOfChat(String chatId) async {
    String messages =
        await http.read('http://localhost:3000/api/chats/$chatId/messages');
    Map<String, dynamic> messagesJson = json.decode(messages);
    return messagesJson;
  }
}
