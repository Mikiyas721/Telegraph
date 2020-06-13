import 'dart:convert';
import 'package:Telegraph/models/chat.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/models/message.dart';
import 'package:Telegraph/models/user.dart';
import 'package:dio/dio.dart';
import '../../others/assistant.dart';

mixin Http {
  Dio dio = Dio();
  final String apiBasePath = 'http://192.168.1.103:3000/api';

  /// POST requests

  Future<dynamic> addUser(UserModel user) async {
    return await dio.post('$apiBasePath/users', data: user.toJSON());
  }

  void addMessage(MessageModel message) async {
    await dio.post('$apiBasePath/users', data: message.toString());
  }

  void addChat(ChatModel chat) async {
    await dio.post('$apiBasePath/users', data: chat.toString());
  }

  Future<Response> addContact(ContactModel contactModel) async {
    return await dio.post('$apiBasePath/contact', data: contactModel.toMap());
  }

  /// GET requests

  Future<List<dynamic>> getChatsForUser(String userId) async {
    try {
      Response chats = await dio.get(
          '$apiBasePath/chats?filter={"where":{"usersid":{"inq":["$userId"]}}}');
      return chats.data;
    } catch (SocketException) {}
  }

  Future<List<dynamic>> getChatOfUsers(
      String userId, String secondUserId) async {
    Response chats = await dio.get(
        '$apiBasePath/calls?filter={"where":{"and":[{"usersid":{"inq":["$userId"]}},{"usersid":{"inq":["$secondUserId"]}}]}}');
    if (chats != null) {
      for (dynamic chat in chats.data) {
        if (chat['personal']) return chat;
      }
    }
    return null;
  }

  Future<List<dynamic>> getCallsForUser(String userId) async {
    Response chat = await dio.get(
        '$apiBasePath/calls?filter={"where":{"or":[{"callerId":{"inq":["$userId"]}},{"receiverId":{"inq":["$userId"]}}]}}');
    return json.decode(chat.data);
  }

  Future<List<dynamic>> getContactsForUser(String userId) async {
    Response chat =
        await dio.get('$apiBasePath/contacts?filter[where][userId]=$userId');
    return chat.data;
  }

  Future<List<dynamic>> getAllContacts() async {
    Response chat = await dio.get('$apiBasePath/contacts');
    return chat.data;
  }

  Future<dynamic> getUserById(String userId) async {
    Response user =
        await dio.get('$apiBasePath/users?filter[where][id]=$userId');
    if (user.data.isNotEmpty) return user.data[0];
    return null;
  }

  Future<dynamic> getUserByNumber(String phoneNumber) async {
    Response user1 = await dio
        .get('$apiBasePath/users?filter[where][phoneNumber]=$phoneNumber');
    if (user1.data.isNotEmpty)
      return user1.data[0];
    else
      return null;
  }

  Future<MessageModel> getMessage(String messageId) async {
    Response user =
        await dio.get('$apiBasePath/messages?filter[where][id]=$messageId');
    return MessageModel.fromMap(json.decode(user.data));
  }

  Future<List<Map<String, dynamic>>> getMessagesOfChat(String chatId) async {
    Response messages =
        await dio.get('$apiBasePath/api/chats/$chatId/messages');
    return messages.data;
  }

  Future<dynamic> getChat(String chatId) async {
    Response response =
        await dio.get('$apiBasePath/chats?filter[where][id]=$chatId');
    if (response != null) return response.data[0];
    return null;
  }

  /// UPDATE requests

  void editUserName(String firstName, String userId, {String lastName}) async {
    var user = await getUserById(userId);
    UserModel newUser;
    newUser = UserModel(
      lastName: user[0][''],
      phone: user[0]['phoneNumber'],
      lastSeen: Assistant.getDateTime(user[0]['']),
      id: userId,
      firstName: firstName,
    );

    await dio.put('$apiBasePath/users', data: newUser.toString());
  }

  void editPhoneNumber(
    String phoneNumber,
    String userId,
  ) async {
    var user = await getUserById(userId);
    UserModel newUser;
    newUser = UserModel(
      lastName: user[0][''],
      phone: phoneNumber,
      lastSeen: Assistant.getDateTime(user[0]['lastSeen']),
      id: userId,
      firstName: user[0]['firstName'],
    );

    await dio.put('$apiBasePath/users', data: newUser.toString());
  }

  void editMessageText(
    String newText,
    String messageId,
  ) async {
    var user = getMessage(messageId);
    MessageModel newMessage;
    user.then((MessageModel futureMessage) {
      newMessage = MessageModel(
          futureMessage.getChatId,
          futureMessage.getSenderId,
          newText,
          futureMessage.getDateTime,
          messageId);
    });
    await dio.put('$apiBasePath/messages', data: newMessage.toString());
  }

  /// DELETE requests

  Future<String> deleteChat(String chatId) async {
    var x = await dio.delete('$apiBasePath/chats/$chatId');
    return jsonDecode(json.encode(x));
  }

  Future<String> deleteMessage(String messageId) async {
    var x = await dio.delete('$apiBasePath/messages/$messageId');
    return jsonDecode(json.encode(x));
  }

  Future<Map<String, dynamic>> deleteUser(String userId) async {
    var x = await dio.delete('$apiBasePath/users/$userId');
    return jsonDecode(json.encode(x));
  }
}
