import 'dart:convert';
import 'Package:http/http.dart' as http;
import 'package:telegraph/assistant.dart';
import 'models/chat.dart';
import 'models/message.dart';
import 'models/user.dart';

class Http {
  /// POST requests

  static void addUser(User user) async {
    await http.post('http://localhost:3000/api/users', body: user.toString());
  }

  static void addMessage(Message message) async {
    await http.post('http://localhost:3000/api/users', body:message.toString());
  }

  static void addChat(Chat chat) async {
    await http.post('http://localhost:3000/api/users', body:chat.toString());
  }

  /// GET requests

  static Future<Map<String, dynamic>> getChatsForUser(String userId) async {
    String chats = await http.read(
        'http://localhost:3000/api/chats?filter={"where":{"usersid":{"inq":["$userId"]}}}');
    return json.decode(chats);
  }

  static Future<Map<String, dynamic>> getMessagesOfChat(String chatId) async {
    String messages =
    await http.read('http://localhost:3000/api/chats/$chatId/messages');
    return json.decode(messages);
  }

  static Future<User> getUser(String userId) async {
    String user = await http
        .read('http://localhost:3000/api/users?filter[where][id]=$userId');
    return User.fromJson(json.decode(user));
  }

  static Future<Message> getMessage(String messageId) async {
    String user = await http.read(
        'http://localhost:3000/api/messages?filter[where][id]=$messageId');
    return Message.fromJson(json.decode(user));
  }

  static Future<Chat> getChat(String chatId) async {
    String chat = await http
        .read('http://localhost:3000/api/chats?filter[where][id]=$chatId');
    return Chat.fromJson(json.decode(chat));
  }

  /// UPDATE requests

  static void editUserName(String firstName, String userId,
      {String lastName}) async {
    var user = getUser(userId);
    User newUser;
    if (lastName == null) {
      user.then((User futureUser) {
        newUser = User(
            firstName,
            futureUser.getPhoneNumber,
            Assistant.getBoolean(futureUser.isOnline),
            Assistant.getDateTime(futureUser.getLastSeen),
            userId,
            lastName: futureUser.getFirstName,
            profilePictureURL: futureUser.profilePictureURL);
      });
    } else {
      user.then((User futureUser) {
        newUser = User(
            firstName,
            futureUser.getPhoneNumber,
            Assistant.getBoolean(futureUser.isOnline),
            Assistant.getDateTime(futureUser.getLastSeen),
            userId,
            lastName: lastName,
            profilePictureURL: futureUser.profilePictureURL);
      });
    }
    await http.put('http://localhost:3000/api/users', body: newUser.toString());
  }

  static void editPhoneNumber(String phoneNumber,
      String userId,) async {
    var user = getUser(userId);
    User newUser;
    user.then((User futureUser) {
      newUser = User(
          futureUser.getFirstName,
          phoneNumber,
          Assistant.getBoolean(futureUser.isOnline),
          Assistant.getDateTime(futureUser.getLastSeen),
          userId,
          lastName: futureUser.getLastName,
          profilePictureURL: futureUser.profilePictureURL);
    });
    await http.put('http://localhost:3000/api/users', body: newUser.toString());
  }

  static void editMessageText(String newText,
      String messageId,) async {
    var user = getMessage(messageId);
    Message newMessage;
    user.then((Message futureMessage) {
      newMessage = Message(futureMessage.getChatId, futureMessage.getSenderId,
          newText, futureMessage.getDateTime, messageId);
    });
    await http.put('http://localhost:3000/api/messages',
        body: newMessage.toString());
  }

  /// DELETE requests

  static Future<String> deleteChat(String chatId) async {
    var x = await http.delete('http://localhost:3000/api/chats/$chatId');
    return jsonDecode(json.encode(x));
  }

  static Future<String> deleteMessage(String messageId) async {
    var x = await http.delete('http://localhost:3000/api/messages/$messageId');
    return jsonDecode(json.encode(x));
  }

  static Future<Map<String, dynamic>> deleteUser(String userId) async {
    var x = await http.delete('http://localhost:3000/api/users/$userId');
    return jsonDecode(json.encode(x));
  }
}
