import '../core/jsonModel.dart';
import '../core/repository.dart';
import '../data/mixin/http.dart';
import '../models/user.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class UserRepo extends ItemRepo<UserModel> with Http {
  UserRepo(BehaviorSubject<JSONModel> subject) : super(subject);

  Future<Response> addNewUser(UserModel newUser) async {
    return await dio.post('$apiBasePath/users', data: newUser.toJSON());
  }
}
