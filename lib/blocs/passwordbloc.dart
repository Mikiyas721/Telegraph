import 'dart:async';

class Bloc {

  final StreamController<String> _passwordController =
      StreamController<String>();

  Function(String password) get addPassword => _passwordController.sink.add;

  Stream<String> get password => _passwordController.stream.transform(validateFirstPassword);

  final validateFirstPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length == 4) {
      sink.add(password);
    } else {
      sink.addError('Password has to be 4 digits long');
    }
  });
  dispose(){
    _passwordController.close();
  }
}
final bloc = new Bloc();
