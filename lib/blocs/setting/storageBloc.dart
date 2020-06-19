import '../../core/utils/disposable.dart';
import 'package:rxdart/rxdart.dart';

class StorageBloc extends Disposable {
  final whenOnDataStream = BehaviorSubject();
  final whenOnWifiStream = BehaviorSubject();

  Stream<List<String>> get whenOnData =>
      whenOnDataStream.map((newValue) => newValue);

  Function(String newValue) get setWhenOnData => whenOnDataStream.add;

  Stream<List<String>> get whenOnWifi => whenOnWifiStream.map((newValue) => newValue);

  Function(String newValue) get setWhenOnWifi => whenOnWifiStream.add;

  @override
  void dispose() {
    whenOnDataStream.close();
    whenOnWifiStream.close();
  }
}
