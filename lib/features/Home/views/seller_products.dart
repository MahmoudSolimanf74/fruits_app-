import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/views/product_info.dart';
import 'package:fruits_app/features/Home/widgets/catigory_card.dart';
import 'package:fruits_app/features/Home/widgets/product_card.dart';
import 'package:fruits_app/features/Home/widgets/seller_card.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class SellerProducts extends StatelessWidget {
  const SellerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fruit Market")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SellerCard(
                name: "Seller name",
                image: 'assets/5.png',
                description: 'delivery Charges : 0.5 KD',
                state: 'open',
                product: 'Pizza',
                rate: "",
                distance: "",
              ),
              CustomText(
                title: "Catigoris",
                size: 24,
                fontWeights: FontWeight.bold,
                color: AppColors.secondarycolor,
              ),
              Gap(10),
              Row(children: [...List.generate(4, (index) => CatigoryCard())]),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ProductCard(
                  ontap: () => MyNavigator.goto(context, ProductInfo()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
