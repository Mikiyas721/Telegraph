import '../core/jsonModel.dart';
import '../core/repository.dart';
import '../models/password.dart';
import 'package:rxdart/rxdart.dart';

class PasswordRepo extends ItemRepo<PasswordModel>{
  PasswordRepo(BehaviorSubject<JSONModel> subject) : super(subject);

  BehaviorSubject<PasswordModel> get passwordSubject => dataStream;

  Stream<PasswordModel> get passwordStream => dataStream.map((password) => password);

  Function(PasswordModel passwordModel) get setPassword => dataStream.add;
}
