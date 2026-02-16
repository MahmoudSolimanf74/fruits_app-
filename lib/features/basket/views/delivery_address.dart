import 'package:flutter/material.dart';
import 'package:fruits_app/features/basket/viewmodel/checkout_viewmodel.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class DeliveryAddress extends StatefulWidget {
  final CheckoutViewmodel viewmodel;
  const DeliveryAddress({super.key, required this.viewmodel});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    var viewmodel = widget.viewmodel;
    return Scaffold(
      body: Column(
        children: [
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
                  CustomText(
                    title: "Add New Address",
                    size: 18,
                    fontWeights: FontWeight.bold,
                  ),
                  Spacer(),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
          Gap(20),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        title: "Address 1",
                        size: 18,
                        fontWeights: FontWeight.bold,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          shape: .circle,
                          border: Border.all(),
                        ),
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                  CustomText(
                    title:
                        "John Doe \n +000-11-1234567 \n Room # 1 - Ground Floor, Al Najoum Building, 24 B \n Street, Dubai - United Arab Emirates ",
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Gap(100),
          CustomButton(
            text: "Continue",
            ontap: () => viewmodel.nextPage(),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
