import 'package:flutter/material.dart';
import 'package:fruits_app/features/favorites/widgets/fav_card.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FavoritesScreen extends StatelessWidget {
  final PersistentTabController? controller;
  const FavoritesScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 0,
        backgroundColor: AppColors.primarycolor,
        surfaceTintColor: Colors.transparent,
        title: CustomText(
          title: "Favorite",
          size: 24,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Divider(),
            Expanded(
              child: isLandscape
                  ? GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 2,
                            childAspectRatio: 4,
                          ),
                      itemBuilder: (context, index) => const FavCard(),
                    )
                  : ListView.separated(
                      itemCount: 9,
                      separatorBuilder: (context, index) => const Gap(6),
                      itemBuilder: (context, index) => const FavCard(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
