import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/root_viewmodel.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:fruits_app/features/Home/views/home_screen.dart';
import 'package:fruits_app/features/trackorder/views/track_order.dart';
import 'package:fruits_app/features/basket/views/basket_screen.dart';
import 'package:fruits_app/features/favorites/views/favorites_screen.dart';
import 'package:fruits_app/features/more/views/more_screen.dart';

import 'package:fruits_app/utils/theme/app_colors.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: RootTabController.controller,
      screens: _screens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style7,
      backgroundColor: AppColors.secondarycolor,
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
    );
  }
}

List<Widget> _screens() {
  return const [
    HomeScreen(),
    TrackOrder(),
    BasketScreen(),
    FavoritesScreen(),
    MoreScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    AppNavItem(icon: Icons.home_outlined, title: "Home"),
    AppNavItem(icon: Icons.format_list_numbered, title: "Order"),
    AppNavItem(icon: Icons.shopping_cart_outlined, title: "Basket"),
    AppNavItem(icon: Icons.favorite_border, title: "Favorites"),
    AppNavItem(icon: Icons.menu, title: "More"),
  ];
}

class AppNavItem extends PersistentBottomNavBarItem {
  AppNavItem({
    required IconData icon,
    required String title,
  }) : super(
          icon: Icon(icon),
          title: title,
          activeColorPrimary: AppColors.primarycolor,
          activeColorSecondary: AppColors.secondarycolor,
          inactiveColorPrimary: Colors.grey,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        );
}
