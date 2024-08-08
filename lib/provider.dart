import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  String language = 'en';

  void changeAppLanguage(String lang){
    language = lang;
    notifyListeners();
  }

}