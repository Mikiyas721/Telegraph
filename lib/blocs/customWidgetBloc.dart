import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class CustomWidgetBloc extends Disposable {
  final dialogMenuStream = BehaviorSubject();

  Stream<String> get dialogMenu => dialogMenuStream.map((newValue) => newValue);

  Function(String newMenu) get setDialogMenuString => dialogMenuStream.add;

  @override
  void dispose() {
    dialogMenuStream.close();
  }
}
