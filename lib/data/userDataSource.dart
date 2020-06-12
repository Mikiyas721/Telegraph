import 'package:Telegraph/core/jsonModel.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/data/mixin/http.dart';
import 'package:Telegraph/models/user.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class UserRepo extends ItemRepo<UserModel> with Http {
  UserRepo(BehaviorSubject<JSONModel> subject) : super(subject);

  Future<Response> addUser(UserModel newUser) async {
    return await dio.post('$apiBasePath/users', data: newUser.toJSON());
  }
}
