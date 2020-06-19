import '../core/jsonModel.dart';
import '../ui/customWidgets/callItem.dart';

class CallModel extends JSONModel {
  //final String imageUrl;
  String userName;
  DateTime dateTime;
  CallType callType;

  CallModel({String key,
    /*this.imageUrl, */
    this.dateTime,
    this.callType})
      : userName = key,
        super(key);

  set key(String value) {
    userName = value;
  }

  set type(CallType type) {
    callType = type;
  }

  set date(DateTime date) {
    dateTime = date;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      //'imageUrl': imageUrl,
      'userName': userName,
      'callTime': dateTime,
      'callType': callType
    };
  }

  factory CallModel.fromMap(Map<String, dynamic> map) {
    return CallModel(
        key: map['userName'],
        // imageUrl: map['imageUrl'],
        dateTime: map['callTime'],
        callType: map['callType']);
  }
}
