import '../core/jsonModel.dart';
import '../core/repository.dart';
import '../models/value.dart';
import 'package:rxdart/rxdart.dart';

class ValueRepo extends ItemRepo<ValueModel>{
  ValueRepo(BehaviorSubject<JSONModel> subject) : super(subject);

}