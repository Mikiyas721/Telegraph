import '../core/repository.dart';
import '../data/mixin/http.dart';
import '../models/message.dart';
import 'package:rxdart/rxdart.dart';

class MessageRepo extends ListRepo<MessageModel> with Http{
  MessageRepo(BehaviorSubject<List<MessageModel>> subject) : super(subject);

}
