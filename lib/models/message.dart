import '../core/jsonModel.dart';
import '../others/assistant.dart';

class MessageModel extends JSONModel {
  final String _chatId;
  final String _senderId;
  final String _messageText;
  final DateTime _messageDateTime;
  final String _messageId;

  @override
  String toString() {
    return '''{
      "senderid": "$_senderId",
      "text": "$_messageText",
      "date": ${Assistant.getDateString(_messageDateTime)}//TODO check out the effect of the models relationship and fix the redundant props.
    }''';
  }

  MessageModel(this._chatId, this._senderId, this._messageText,
      this._messageDateTime, this._messageId)
      : super(_chatId);

  String get getChatId => _chatId;

  String get getSenderId => _senderId;

  String get getText => _messageText;

  DateTime get getDateTime => _messageDateTime;

  String get getId => _messageId;

  factory MessageModel.fromMap(Map<String, dynamic> json) {
    return MessageModel(json['chatId'], json['senderId'], json['messageText'],
        Assistant.getDateTime(json['messageDateTime']), json['messageId']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'chatId': _chatId,
      'senderId': _senderId,
      'messageText': _messageText,
      'messageDateTime': _messageDateTime,
      'messageId': _messageId
    };
  }
}
