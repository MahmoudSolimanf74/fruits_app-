import 'package:flutter/material.dart';
import 'package:fruits_app/features/basket/views/basket_screen.dart';
import 'package:fruits_app/features/trackorder/views/track_order.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:fruits_app/features/Home/views/home_screen.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _screens() {
    return const [
      HomeScreen(),
      TrackOrder(),
      BasketScreen(),
      Center(child: Text("Favorites")),
      Center(child: Text("More")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      AppNavItem(icon: Icons.home_outlined, title: "Home"),
      AppNavItem(icon: Icons.format_list_numbered, title: "Order"),
      AppNavItem(icon: Icons.shopping_cart, title: "Basket"),
      AppNavItem(icon: Icons.favorite, title: "Favorites"),
      AppNavItem(icon: Icons.person, title: "More"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
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

class AppNavItem extends PersistentBottomNavBarItem {
  AppNavItem({required IconData icon, required String title})
    : super(
        icon: Icon(icon),
        title: title,
        activeColorPrimary: AppColors.primarycolor,
        activeColorSecondary: AppColors.secondarycolor,
        inactiveColorPrimary: Colors.grey,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      );
}
