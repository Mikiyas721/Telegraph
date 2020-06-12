import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/data/mixin/http.dart';
import 'package:Telegraph/models/message.dart';
import 'package:rxdart/rxdart.dart';

class MessageRepo extends ListRepo<MessageModel> with Http{
  MessageRepo(BehaviorSubject<List<MessageModel>> subject) : super(subject);

}
