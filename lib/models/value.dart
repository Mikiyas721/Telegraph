import 'package:Telegraph/core/jsonModel.dart';

class ValueModel extends JSONModel {
  ValueModel(String id) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {'id': id};
  }
}
