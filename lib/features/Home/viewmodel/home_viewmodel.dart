import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  final PageController pageController = PageController();
  bool offerFilter = false;
  bool freeDeliveryFilter = false;
  int currentIndex = 0;

  final List<String> banners = [
    "assets/3.png",
    "assets/3.png",
    "assets/3.png",
    "assets/3.png",
  ];

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void ontap() {}

  void selectOfferfilter() {
    offerFilter = !offerFilter;
  }
  void selectfreeDeliveryFilter() {
    freeDeliveryFilter = !freeDeliveryFilter;
  }
}
