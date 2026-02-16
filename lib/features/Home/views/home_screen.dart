import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/home_viewmodel.dart';
import 'package:fruits_app/features/Home/widgets/catigory_card.dart';
import 'package:fruits_app/features/Home/widgets/seller_card.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:fruits_app/utils/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final PersistentTabController? controller;
  const HomeScreen({super.key, this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final viewmodel = HomeViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomText(
          title: "Fruit Market",
          size: 24,
          color: AppColors.secondarycolor,
          fontWeights: FontWeight.bold,
        ),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.search,
              size: 50,
              color: AppColors.secondarycolor,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Dialog(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primarycolor,
                          ),
                          width: 350,
                          height: 350,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: .center,
                                  children: [
                                    CustomText(
                                      title: "Filter by",
                                      size: 18,
                                      fontWeights: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Delivered to "),
                                    Icon(Icons.pedal_bike_sharp),
                                  ],
                                ),
                                CustomTextField(text: "", hintText: "Areas"),
                                Gap(20),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () => viewmodel.selectOfferfilter(),
                                        );
                                      },

                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: .circle,
                                          border: Border.all(),
                                        ),
                                        width: 25,
                                        height: 25,
                                        child: viewmodel.offerFilter
                                            ? Icon(Icons.check)
                                            : null,
                                      ),
                                    ),
                                    Gap(5),
                                    CustomText(title: "Offers", size: 18),
                                  ],
                                ),
                                Gap(5),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () => viewmodel
                                              .selectfreeDeliveryFilter(),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: .circle,
                                          border: Border.all(),
                                        ),
                                        width: 25,
                                        height: 25,
                                        child: viewmodel.freeDeliveryFilter
                                            ? Icon(Icons.check)
                                            : null,
                                      ),
                                    ),
                                    Gap(5),
                                    CustomText(title: "freeDelivery", size: 18),
                                  ],
                                ),
                                Gap(20),
                                CustomButton(
                                  text: "apply Filter",
                                  ontap: () => MyNavigator.pop(context),
                                ),
                                TextButton(
                                  onPressed: () => MyNavigator.pop(context),
                                  child: CustomText(title: "Colse", size: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          Gap(5),
          Icon(
            Icons.vertical_distribute,
            size: 40,
            color: AppColors.secondarycolor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Divider(),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: viewmodel.pageController,
                onPageChanged: (value) => viewmodel.onPageChanged(value),
                itemCount: viewmodel.banners.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(
                      viewmodel.banners[index],
                      width: 400,
                      height: 130,
                    ),
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: viewmodel,
              builder: (context, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    viewmodel.banners.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: viewmodel.currentIndex == index ? 12 : 8,
                      height: viewmodel.currentIndex == index ? 12 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: viewmodel.currentIndex == index
                            ? AppColors.secondarycolor
                            : AppColors.greycolor,
                      ),
                    ),
                  ),
                );
              },
            ),

            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                mainAxisAlignment: .spaceAround,
                children: [...List.generate(7, (index) => CatigoryCard())],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    CustomText(title: "Sellers", size: 18),
                    Spacer(),
                    TextButton(onPressed: () {}, child: Text("Show all")),
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      8,
                      (index) => SellerCard(
                        name: "Seller name",
                        image: 'assets/5.png',
                        description: 'delivery Charges : 0.5 KD',
                        state: 'open',
                        product: 'Pizza',
                        rate: '4.5',
                        distance: '2.5 KM',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
