import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/product_info_viewmodel.dart';
import 'package:fruits_app/features/basket/views/basket_screen.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  final ProductInfoViewmodel viewmodel = ProductInfoViewmodel();
  @override
  Widget build(BuildContext context) {
    var selectedWeight = viewmodel.weight[0];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Product name",
          size: 24,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
        actions: [
          Icon(Icons.favorite, color: AppColors.redcolor),
          Gap(20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Column(
          children: [
            Image.asset("assets/11.png"),
            Gap(10),
            Row(
              children: [
                CustomText(
                  title: "Product name",
                  size: 24,
                  fontWeights: FontWeight.bold,
                ),
                Spacer(),
                CustomText(
                  title: "12.00 KD",
                  size: 18,
                  fontWeights: FontWeight.bold,
                  color: AppColors.blackcolor,
                ),
                Gap(60),
              ],
            ),
            CustomText(
              title:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore\n magna aliqua.",
              size: 14,
            ),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Weight",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              initialValue: viewmodel.weight[0],
              items: viewmodel.weight
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedWeight = value.toString();
                });
              },
            ),
            Gap(40),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Weight",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              initialValue: viewmodel.addons[0],
              items: viewmodel.addons
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedWeight = value.toString();
                });
              },
            ),
            Gap(50),
            CustomButton(
              text: "Add to cart",
              ontap: () => MyNavigator.goToReplacement(context, BasketScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
