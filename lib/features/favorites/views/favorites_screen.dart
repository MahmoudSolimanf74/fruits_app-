import 'package:flutter/material.dart';
import 'package:fruits_app/features/favorites/widgets/fav_card.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FavoritesScreen extends StatelessWidget {
  final PersistentTabController? controller;
  const FavoritesScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Favorite",
          size: 24,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
        centerTitle: true,
      ),
      body: Column(children: [Divider(), FavCard()]),
    );
  }
}
