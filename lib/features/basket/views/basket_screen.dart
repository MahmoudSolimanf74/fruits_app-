import 'package:flutter/material.dart';
import 'package:fruits_app/features/basket/views/checkout_screen.dart';
import 'package:fruits_app/features/basket/widget/basket_card.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BasketScreen extends StatelessWidget {
  final PersistentTabController? controller;
  const BasketScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(
      
        backgroundColor: Colors.transparent,
        title: CustomText(
          title: "Basket",
          size: 28,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [...List.generate(6, (index) => BasketCard())],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Divider(),
              Row(children: [Text("Subtotal"), Spacer(), Text("36.00\$")]),
              Row(
                children: [Text("shipping charges"), Spacer(), Text("1.50\$")],
              ),
              Row(children: [Text("Bag Total"), Spacer(), Text("37.50\$")]),
              Gap(20),
              Row(
                children: [
                  Text("total : 37.50"),
                  Spacer(),
                  CustomButton(
                    text: "Procced To Checkout",
                    ontap: () => MyNavigator.goto(context, CheckoutScreen()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
