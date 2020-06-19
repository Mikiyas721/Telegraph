import '../../core/utils/disposable.dart';
import 'package:rxdart/rxdart.dart';

class ChatBackgroundBloc extends Disposable {
  final chatBackgroundStream = BehaviorSubject();

  Stream<String> get chatBackground =>
      chatBackgroundStream.map((selectedString) => selectedString);

  Function(String selectedString) get setChatBackground =>
      chatBackgroundStream.add;

  @override
  void dispose() {
    chatBackgroundStream.close();
  }
}
