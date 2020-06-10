import 'dart:convert' show json;
import 'dart:convert' show base64, utf8;

import 'package:dio/dio.dart';

class SMSHandler {
  final String accountSid = 'AC66895fb351d710b953b53743d942b5cf';
  final String authToken = 'b3f9063b503078a28c7a3cf728aee4ed';
  final String from = '+17039103539';
  final String to;
  final String messageBody;
  final String TWILIO_SMS_API_BASE_URL = 'https://api.twilio.com/2010-04-01';


  const SMSHandler(
      {this.to, this.messageBody});

  Future<Map> create() async {
    var url =
        '${TWILIO_SMS_API_BASE_URL}/Accounts/${accountSid}/Messages.json';
    try {
      var response = await Dio().post(url, data: {
        'From': from,
        'To': to,
        'Body': messageBody
      });
      return (json.decode(response.data));
    } catch (e) {
      return ({'Runtime Error': e});
    } finally {
    }
  }

  String toAuthCredentials(String accountSid, String authToken) =>
      base64.encode(utf8.encode(accountSid + ':' + authToken));
}
