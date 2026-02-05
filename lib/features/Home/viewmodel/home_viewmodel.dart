import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;



  final List<String> banners = 
  [
    "assets/3.png",
    "assets/3.png",
    "assets/3.png",
    "assets/3.png",
  ];

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void ontap(){

  }
}