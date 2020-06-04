import 'dart:async';
import 'package:Telegraph/data/http.dart';
import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/call.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:Telegraph/ui/customWidgets/callItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallDataSource extends CRUDListSource<CallModel> {

  @override
  Future<int> count({where, bool forceRefresh}) {
    return null;
  }

  @override
  FutureOr<CallModel> create(CallModel t) {
    return null;
  }

  @override
  FutureOr<void> delete(String id) {
    return null;
  }

  @override
  FutureOr<void> deleteAll() {
    return null;
  }

  @override
  FutureOr<List<CallModel>> get({filter, bool forceRefresh}) async {
    print("In concrete get method");
    List<dynamic> responseBody = await Http.getCallsForUser(filter);
     if(responseBody.isNotEmpty) {
      List<CallModel> callsList = List<CallModel>();
      for (Map<String, dynamic> call in responseBody) {
        CallModel currentCall = CallModel();
        String secondPersonId;
        call['callerId'] == filter
            ? currentCall.type = CallType.OUTGOING
            : currentCall.type = CallType.INCOMING;
        currentCall.date = Assistant.getDateTime(call['call_time']);
        call['callerId'] == filter
            ? secondPersonId = call['receiverId']
            : secondPersonId = call['callerId'];
        final secondPersonList = await Http.getUserById(secondPersonId);
        if (!(secondPersonList[0]['lastName'] == null)) {
          currentCall.key = secondPersonList[0]['firstName'] +
              " " +
              secondPersonList[0]['lastName'];
        } else {
          currentCall.key = secondPersonList[0]['firstName'];
        }
        callsList.add(currentCall);
      }
      return callsList;
    }
     return [];
  }

  @override
  FutureOr<CallModel> getById(String id, {filter, bool forceRefresh}) {
    return null;
  }

  @override
  FutureOr<CallModel> update(CallModel t) {
    return null;
  }
}

class CacheCallDataSource extends CacheCRUDListSource<CallModel>
    implements CallDataSource {
  CacheCallDataSource(SharedPreferences preference)
      : super(preference, 'call', (call) => CallModel.fromMap(call));
}

class CallRepo extends ListRepo<CallModel, CallDataSource> {
  CallRepo(String key) : super(key);

  Stream<List<CallModel>> get callStream => items.map((call) => call);

  Function(List<CallModel> callModel) get setCall => items.add;
}
