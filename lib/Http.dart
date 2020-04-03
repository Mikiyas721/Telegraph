import 'dart:convert';
import 'Package:http/http.dart' as http;
import 'package:telegraph/models/chat.dart';

import 'models/user.dart';

class Http {
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

  /// POST requests

  /// UPDATE requests

  static editUserName(String firstName, String userId,
      {String lastName}) async {
    var user = getUser(userId);
    User newUser;
    user.then((User futureUser) {
      newUser = User(
          firstName,
          futureUser.getPhoneNumber,
          getBoolean(futureUser.isOnline),
          getDateTime(futureUser.getLastSeen),
          userId,
          lastName: futureUser.lastName,
          profilePictureURL: futureUser.profilePictureURL);
    });
    var x = await http.put('http://localhost:3000/api/users',
        body: newUser.toString());
  }

  static bool getBoolean(String bool) {
    if (bool == 'true')
      return true;
    else
      return false;
  }

  static DateTime getDateTime(String dateString) {
    List<String> split = dateString.split('T');
    List<String> date = split[0].split('-');
    List<String> time = split[1].split(':');
    return DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]),
        int.parse(time[0]), int.parse(time[1]), int.parse(time[2]));
  }
  static String getDateString(){

  }
}
