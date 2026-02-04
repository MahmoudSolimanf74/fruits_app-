import 'package:flutter/material.dart';
import 'package:fruits_app/features/onboard/model/onboard_model.dart';

class OnboardViewmodel extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;
  final List<OnboardItem> onboardItems = [
    OnboardItem(
      title: "E Shopping",
      subtitle: "Explore op organic fruits & grab them",
      image: "assets/2.png",
      buttontext: "Next",
    ),
    OnboardItem(
      title: "Delivery Arrived",
      subtitle: "Order is arrived at your Place",
      image: "assets/2.png",
      buttontext: 'Next',
    ),
    OnboardItem(
      title: "Delivery Arrived",
      subtitle: "Order is arrived at your Place",
      image: "assets/2.png",
      buttontext: 'get Started',
    ),
  ];
  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextPage() {
    if (currentIndex < onboardItems.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    pageController.animateToPage(
      onboardItems.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  bool get isLastPage => currentIndex == onboardItems.length - 1;
}
