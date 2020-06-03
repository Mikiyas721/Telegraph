import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/call.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CallDataSource extends CRUDListSource<CallModel> {}

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
