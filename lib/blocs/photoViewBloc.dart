import 'package:Telegraph/core/utils/disposable.dart';
import 'package:rxdart/rxdart.dart';

class PhotoViewBloc extends Disposable{
  final photoViewStream = BehaviorSubject<String>();

  Stream<String> get photoViewUrl=> photoViewStream.map((url)=>url);
  Function(String newValue) get setPhotoViewUrl=> photoViewStream.add;

  @override
  void dispose() {
    photoViewStream.close();
  }

}