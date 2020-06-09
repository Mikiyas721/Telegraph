import 'package:Telegraph/core/jsonModel.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/value.dart';
import 'package:rxdart/rxdart.dart';

class ValueRepo extends ItemRepo<ValueModel>{
  ValueRepo(BehaviorSubject<JSONModel> subject) : super(subject);

}