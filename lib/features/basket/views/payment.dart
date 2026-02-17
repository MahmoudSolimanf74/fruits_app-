import 'package:flutter/material.dart';
import 'package:fruits_app/features/basket/viewmodel/checkout_viewmodel.dart';
import 'package:fruits_app/features/basket/views/check_out_conf.dart';
import 'package:fruits_app/features/basket/widget/payment_card.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class Payment extends StatefulWidget {
  final CheckoutViewmodel viewmodel;
  const Payment({super.key, required this.viewmodel});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var viewmodel = widget.viewmodel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomText(
              title: "Coupon Code",
              size: 18,
              fontWeights: FontWeight.bold,
              color: AppColors.secondarycolor,
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackcolor.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              width: 390,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          hintText: "Do You Have any Coupon Code?",
                        ),
                      ),
                    ),
                    Spacer(),

                    CustomButton(text: "Apply", width: 80, height: 30),
                  ],
                ),
              ),
            ),
            Divider(),
            Row(children: [Text("Subtotal"), Spacer(), Text("36.00\$")]),
            Row(children: [Text("shipping charges"), Spacer(), Text("1.50\$")]),
            Row(children: [Text("Bag Total"), Spacer(), Text("37.50\$")]),
            Gap(20),
            Row(children: [Text("total : 37.50")]),
            Gap(20),
            PaymentCard(image: 'assets/7.png', title: 'Credit Card/Debit card'),
            Gap(20),
            PaymentCard(image: 'assets/8.png', title: 'Cash of Delivery'),
            Gap(50),
            CustomButton(
              text: "Place Order",
              width: double.infinity,
              ontap: () => MyNavigator.goToReplacement(context, CheckOutConf()),
            ),
          ],
        ),
      ),
    );
  }
}
