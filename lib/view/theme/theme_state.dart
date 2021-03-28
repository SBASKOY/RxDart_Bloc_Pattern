import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeState {
  final _theme = new BehaviorSubject<ThemeMode>.seeded(ThemeMode.light);

  Stream<ThemeMode> get theme => _theme.stream;

  Function(ThemeMode) get changeTheme => _theme.sink.add;

  dispose() {
    _theme.close();
  }
}