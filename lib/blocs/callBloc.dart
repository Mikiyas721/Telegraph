import 'dart:convert';

import 'package:Telegraph/blocs/http.dart';
import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/callDataSource.dart';
import 'package:Telegraph/models/call.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:Telegraph/ui/customWidgets/callItem.dart';
import 'package:get_it/get_it.dart';

class CallBloc extends Disposable {
  CallRepo get callRepo => GetIt.instance.get();

  void fetchCalls(String userId) async {
    List<dynamic> responseBody = await Http.getCallForUser(userId);
    if (responseBody[0] == null) {
      callRepo.setCall([CallModel(key: null)]);
    } else {
      List<CallModel> callsList = List<CallModel>();
      for (Map<String, dynamic> call in responseBody) {
        CallModel currentCall = CallModel();
        String secondPersonId;
        call['callerId'] == userId
            ? currentCall.type = CallType.OUTGOING
            : currentCall.type = CallType.INCOMING;
        currentCall.date = Assistant.getDateTime(call['call_time']);
        call['callerId'] == userId
            ? secondPersonId = call['receiverId']
            : secondPersonId = call['callerId'];
        final secondPersonList = await Http.getUser(secondPersonId);
        if (!(secondPersonList[0]['lastName'] == null)) {
          currentCall.key =
              secondPersonList[0]['firstName'] + " " +
                  secondPersonList[0]['lastName'];
        } else {
          currentCall.key =
          secondPersonList[0]['firstName'];
        }
        callsList.add(currentCall);
      }
      callRepo.setCall(callsList);
    }
  }

  @override
  void dispose() {}
}
