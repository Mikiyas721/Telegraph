import 'dart:async';
import '../core/jsonModel.dart';
import '../data/mixin/http.dart';
import '../core/repository.dart';
import '../models/call.dart';
import '../others/assistant.dart';
import '../ui/customWidgets/callItem.dart';
import 'package:rxdart/rxdart.dart';

class CallRepo extends ListRepo with Http{
  CallRepo(BehaviorSubject<List<JSONModel>> subject) : super(subject);


  Stream<List<CallModel>> get callStream => dataStream.map((call) => call);

  FutureOr<List<CallModel>> getCallModels({String userId}) async {
    List<dynamic> responseBody = await getCallsForUser(userId);
    if (responseBody.isNotEmpty) {
      List<CallModel> callsList = List<CallModel>();
      responseBody.forEach((call) {
        String x = call['callerId'];
      });
      responseBody.forEach((call) async{
        CallModel currentCall = CallModel();
        String secondPersonId;
        call['callerId'] == userId
            ? currentCall.type = CallType.OUTGOING
            : currentCall.type = CallType.INCOMING;
        currentCall.date = Assistant.getDateTime(call['call_time']);
        call['callerId'] == userId
            ? secondPersonId = call['receiverId']
            : secondPersonId = call['callerId'];
        print('Second Person Id $secondPersonId');
        final secondPersonList = await getUserById(secondPersonId);
        if (!(secondPersonList['lastName'] == null)) {
          currentCall.key = secondPersonList['firstName'] +
              " " +
              secondPersonList['lastName'];
        } else {
          currentCall.key = secondPersonList['firstName'];
        }
        callsList.add(currentCall);
      });

      return callsList;
    }
    return [];
  }

  Function(List<CallModel> callModel) get setCall => dataStream.add;
}
