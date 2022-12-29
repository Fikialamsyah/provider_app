import 'package:flutter/material.dart';

class HelloProvider extends ChangeNotifier {
  String _text = '';
  String get text => _text;

  void hello() {
    _text = 'Hello, World!';
    notifyListeners();
  }
}
