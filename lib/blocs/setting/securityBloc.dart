import 'package:Telegraph/core/utils/disposable.dart';
import 'package:rxdart/rxdart.dart';

class SecurityBloc extends Disposable {
  final lastSeenStream = BehaviorSubject();
  final callStream = BehaviorSubject();

  Stream<String> get lastSeen {
    return lastSeenStream.map((newValue) => newValue);
  }

  Function(String password) get setLastSeen => lastSeenStream.add;

  Stream<String> get calls {
    return callStream.map((newValue) => newValue);
  }

  Function(String password) get setCalls => callStream.add;

  @override
  void dispose() {
    lastSeenStream.close();
    callStream.close();
  }
}
