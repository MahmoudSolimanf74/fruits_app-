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
    final size = MediaQuery.of(context).size;
    final isWide =
        MediaQuery.of(context).orientation == Orientation.landscape ||
        size.width >= 700;

    Widget summarySection() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Row(children: const [Text("Subtotal"), Spacer(), Text("36.00\$")]),
            Row(
              children: const [
                Text("shipping charges"),
                Spacer(),
                Text("1.50\$"),
              ],
            ),
            Row(children: const [Text("Bag Total"), Spacer(), Text("37.50\$")]),
            const Gap(20),
            // زر الدفع + الكلام اللي فوقه على الشمال
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("total : 37.50"),
                const Gap(10),
                CustomButton(
                  width: double.infinity,
                  text: "Procced To Checkout",
                  ontap: () => MyNavigator.goto(context, CheckoutScreen()),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
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
        child: isWide
            // شاشات واسعة/أفقي: ليست على الشمال + ملخص على اليمين وبينهم فاصل رأسي
            ? Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) => const BasketCard(),
                    ),
                  ),
                  const VerticalDivider(width: 16),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(child: summarySection()),
                  ),
                ],
              )
            // رأسي/شاشة ضيقة: ليست زي ما هي + ملخص تحت
            : ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => const BasketCard(),
              ),
      ),
      bottomNavigationBar: isWide
          ? null
          : SizedBox(height: 192, child: summarySection()),
    );
  }
}
