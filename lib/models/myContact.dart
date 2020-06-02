import 'package:Telegraph/core/json_model.dart';
import 'package:flutter/material.dart';

class MyContact extends JSONModel{
  final String firstName;
  MyContact({@required this.firstName}) : super(firstName);

  @override
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName
    };
  }
  factory MyContact.fromMap(Map<String,dynamic> map){
    return MyContact(firstName: map['firstName']);
  }

}