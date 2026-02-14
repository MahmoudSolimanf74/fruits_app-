import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class RootTabController {
  static final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  static void goToTab(int index) {
    controller.jumpToTab(index);
  }
}
