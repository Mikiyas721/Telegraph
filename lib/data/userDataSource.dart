import 'package:Telegraph/core/jsonModel.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/user.dart';
import 'package:rxdart/rxdart.dart';

class UserRepo extends ItemRepo<UserModel>{
  UserRepo(BehaviorSubject<JSONModel> subject) : super(subject);
}