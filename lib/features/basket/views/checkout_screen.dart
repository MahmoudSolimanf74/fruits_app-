import 'package:flutter/material.dart';
import 'package:fruits_app/features/basket/viewmodel/checkout_viewmodel.dart';
import 'package:fruits_app/features/basket/views/delivery_address.dart';
import 'package:fruits_app/features/basket/views/delivery_time.dart';
import 'package:fruits_app/features/basket/views/payment.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CheckoutScreen extends StatefulWidget {
  final PersistentTabController? controller;
  const CheckoutScreen({super.key, this.controller});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final viewmodel = CheckoutViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          title: "Chechout",
          size: 28,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Divider(),
            Gap(30),
            AnimatedBuilder(
              animation: viewmodel,
              builder: (context, _) {
                return Row(
                  mainAxisAlignment: .spaceAround,
                  children: List.generate(
                    viewmodel.pagename.length,
                    (index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 700),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: viewmodel.currentIndex == index ? 12 : 8,
                          height: viewmodel.currentIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: viewmodel.currentIndex == index
                                ? AppColors.secondarycolor
                                : AppColors.greycolor,
                          ),
                        ),
                        Gap(6),
                        CustomText(
                          title: viewmodel.pagename[index],
                          size: viewmodel.currentIndex == index ? 18 : 14,
                          color: viewmodel.currentIndex == index
                              ? AppColors.secondarycolor
                              : AppColors.blackcolor,
                          fontWeights: viewmodel.currentIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Gap(50),
            Expanded(
              child: PageView(
                controller: viewmodel.pageController,
                onPageChanged: viewmodel.onPageChanged,
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  DeliveryTime(viewmodel: viewmodel),
                  DeliveryAddress(viewmodel: viewmodel),
                  Payment(viewmodel: viewmodel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
