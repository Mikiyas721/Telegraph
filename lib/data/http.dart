import 'dart:convert';
import 'Package:http/http.dart' as http;
import 'package:Telegraph/models/chat.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/models/message.dart';
import 'package:Telegraph/models/user.dart';

import '../others/assistant.dart';

class Http {
  /// POST requests
  static final String apiBasePath = 'http://192.168.1.103:3000/api';

  static void addUser(UserModel user) async {
    await http.post('$apiBasePath/users', body: user.toString());
  }

  static void addMessage(MessageModel message) async {
    await http.post('$apiBasePath/users',
        body: message.toString());
  }

  static void addChat(ChatModel chat) async {
    await http.post('$apiBasePath/users', body: chat.toString());
  }
  static Future<dynamic> addContact(ContactModel contactModel)async{
    await http.post('$apiBasePath/contact', body: contactModel.toMap());
  }

  /// GET requests

  static Future<dynamic> getChatsForUser(String userId) async {
    String chats = await http.read(
        '$apiBasePath/chats?filter={"where":{"usersid":{"inq":["$userId"]}}}');
    return json.decode(chats);
  }

  static Future<Map<String, dynamic>> getMessagesOfChat(String chatId) async {
    String messages =
        await http.read('$apiBasePath/api/chats/$chatId/messages');
    return json.decode(messages);
  }

  static Future<List<dynamic>> getCallsForUser(String userId) async {
    String chat = await http.read(
        '$apiBasePath/calls?filter={"where":{"or":[{"callerId":{"inq":["$userId"]}},{"receiverId":{"inq":["$userId"]}}]}}');
    return json.decode(chat);
  }
  static Future<List<dynamic>> getContactsForUser(String userId) async {
    String chat = await http.read(
        '$apiBasePath/contacts?filter[where][userId]=$userId');
    return json.decode(chat);
  }

  static Future<dynamic> getUserById(String userId) async {
    String user = await http
        .read('$apiBasePath/users?filter[where][id]=$userId');
    final responseList = json.decode(user);
    if(responseList.isNotEmpty) return responseList[0];
    else return {};
  }
  static Future<List<dynamic>> getUserByNumber(String phoneNumber) async {
    String user = await http
        .read('$apiBasePath/users?filter[where][phoneNumber]=$phoneNumber');
    return json.decode(user);
  }

  static Future<MessageModel> getMessage(String messageId) async {
    String user = await http.read(
        '$apiBasePath/messages?filter[where][id]=$messageId');
    return MessageModel.fromJson(json.decode(user));
  }

  static Future<List<dynamic>> getChat(String chatId) async {
    String chat = await http
        .read('$apiBasePath/chats?filter[where][id]=$chatId');
    return json.decode(chat);
  }

  /// UPDATE requests

  static void editUserName(String firstName, String userId,
      {String lastName}) async {
    var user = await getUserById(userId);
    UserModel newUser;
      newUser = UserModel(
          firstName,
          user[0]['phoneNumber'],
          user[0]['online'] == "true" ? true : false,
          Assistant.getDateTime(user[0]['']),
          userId,
          lastName: user[0][''],
          profilePictureURL: user[0]['']);
    await http.put('http://localhost:3000/api/users', body: newUser.toString());
  }

  static void editPhoneNumber(
    String phoneNumber,
    String userId,
  ) async {
    var user = await getUserById(userId);
    UserModel newUser;
      newUser = UserModel(
          user[0]['firstName'],
          phoneNumber,
          user[0]['online'] == "true" ? true : false,
          Assistant.getDateTime(user[0]['lastSeen']),
          userId,
          lastName: user[0]['lastName'],
          profilePictureURL: user[0]['imageURLs']);
    await http.put('http://localhost:3000/api/users', body: newUser.toString());
  }

  static void editMessageText(
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
    await http.put('http://localhost:3000/api/messages',
        body: newMessage.toString());
  }

  /// DELETE requests

  static Future<String> deleteChat(String chatId) async {
    var x = await http.delete('$apiBasePath/chats/$chatId');
    return jsonDecode(json.encode(x));
  }

  static Future<String> deleteMessage(String messageId) async {
    var x = await http.delete('$apiBasePath/messages/$messageId');
    return jsonDecode(json.encode(x));
  }

  static Future<Map<String, dynamic>> deleteUser(String userId) async {
    var x = await http.delete('$apiBasePath/users/$userId');
    return jsonDecode(json.encode(x));
  }
}
