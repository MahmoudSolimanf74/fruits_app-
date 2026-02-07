import 'package:flutter/widgets.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';

class CheckoutViewmodel extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;
  bool deliveryNow = true;
  bool selectDeliveryTime = false;

  List<String> pagename = ["Delivery Time", "Delivery Address", "Payment"];

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void selectDelivary() {
    deliveryNow = !deliveryNow;
    selectDeliveryTime = !selectDeliveryTime;
    notifyListeners();
  }

  void nextPage() {
    if (currentIndex < 2) {
      // لو عندك 3 صفحات فقط: 0,1,2
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }


}
