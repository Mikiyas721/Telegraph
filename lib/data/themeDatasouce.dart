import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeRepo extends ItemRepo<ThemeModel> {
  ThemeRepo(BehaviorSubject<ThemeModel> subject) : super(subject);

  Stream<ThemeData> get themeDataStream => getStream<ThemeData>((theme) => theme.generateTheme);
}
