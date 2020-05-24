import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class CustomWidgetBloc extends Disposable {
  final dialogMenuStream = BehaviorSubject();
  final photoStream = BehaviorSubject();
  final videoMessageStream = BehaviorSubject();
  final videoStream = BehaviorSubject();
  final fileStream = BehaviorSubject();
  final musicStream = BehaviorSubject();
  final gifStream = BehaviorSubject();

  Stream<String> get dialogMenu => dialogMenuStream.map((newValue) => newValue);

  Function(String newMenu) get setDialogMenuString => dialogMenuStream.add;

  Stream<bool> get photo => photoStream.map((newValue) => newValue);

  Function(bool newValue) get setPhoto => photoStream.add;

  Stream<bool> get videoMessage => videoMessageStream.map((newValue) => newValue);

  Function(bool newValue) get setVideoMessage => videoMessageStream.add;

  Stream<bool> get video => videoStream.map((newValue) => newValue);

  Function(bool newValue) get setVideo => videoStream.add;

  Stream<bool> get file => fileStream.map((newValue) => newValue);

  Function(bool newValue) get setFile => fileStream.add;

  Stream<bool> get music => musicStream.map((newValue) => newValue);

  Function(bool newValue) get setMusic => musicStream.add;

  Stream<bool> get gif => gifStream.map((newValue) => newValue);

  Function(bool newValue) get setGif => gifStream.add;

  @override
  void dispose() {
    dialogMenuStream.close();
    photoStream.close();
    videoMessageStream.close();
    videoStream.close();
    fileStream.close();
    musicStream.close();
    gifStream.close();
  }
}
