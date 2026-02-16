import 'package:flutter/material.dart';

class LangViewmodel extends ChangeNotifier {
  bool arabicLang = false;
  bool englishLang = false;

  void chosearabicLang() {
    arabicLang = true;
    englishLang = false;
  }

  void choseenglishLang() {
    arabicLang = false;
    englishLang = true;
  }
}
