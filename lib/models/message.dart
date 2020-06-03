import 'package:Telegraph/others/assistant.dart';

class MessageModel {
  String _chatId;
  String _senderId;
  String _text;
  DateTime _dateTime;
  String _id;

  @override
  String toString() {
    return '''{
      "senderid": "$_senderId",
      "text": "$_text",
      "date": ${Assistant.getDateString(_dateTime)},//TODO check out the effect of the models relationship and fix the redundant props.
    }''';
  }

  MessageModel(this._chatId, this._senderId, this._text, this._dateTime, this._id);

  String get getChatId => _chatId;

  String get getSenderId => _senderId;

  String get getText => _text;

  DateTime get getDateTime => _dateTime;

  String get getId => _id;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(json['chat_id'], json['senderid'], json['text'],
        Assistant.getDateTime(json['date']), json['id']);
  }
}
