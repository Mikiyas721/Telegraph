import '../core/utils/disposable.dart';
import '../data/callDataSource.dart';
import '../models/call.dart';
import 'package:get_it/get_it.dart';

class CallBloc extends Disposable {
  CallRepo get callRepo => GetIt.instance.get();

  void fetchCalls(String userId) async {
    List<CallModel> data = await callRepo.getCallModels(userId: userId);
    callRepo.setCall(data);
  }

  @override
  void dispose() {}
}
