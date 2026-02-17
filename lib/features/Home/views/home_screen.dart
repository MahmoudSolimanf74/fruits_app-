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
  final viewmodel = HomeViewmodel();

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(
        toolbarHeight: 35,
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
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
              size: 30,
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
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                CustomText(
                                  title: "Filter by",
                                  size: 18,
                                  fontWeights: FontWeight.bold,
                                ),
                                const Gap(10),
                                CustomTextField(text: "", hintText: "Areas"),
                                const Gap(20),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () => viewmodel.selectOfferfilter(),
                                        );
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(),
                                        ),
                                        child: viewmodel.offerFilter
                                            ? const Icon(Icons.check, size: 18)
                                            : null,
                                      ),
                                    ),
                                    const Gap(8),
                                    const Text("Offers"),
                                  ],
                                ),
                                const Gap(10),
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
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(),
                                        ),
                                        child: viewmodel.freeDeliveryFilter
                                            ? const Icon(Icons.check, size: 18)
                                            : null,
                                      ),
                                    ),
                                    const Gap(8),
                                    const Text("Free Delivery"),
                                  ],
                                ),
                                const Spacer(),
                                CustomButton(
                                  text: "Apply Filter",
                                  ontap: () => MyNavigator.pop(context),
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
          const Gap(10),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Divider(),

            /// 🔹 Banner
            SizedBox(
              height: isLandscape ? 140 : 140,
              child: PageView.builder(
                controller: viewmodel.pageController,
                onPageChanged: (value) => viewmodel.onPageChanged(value),
                itemCount: viewmodel.banners.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(viewmodel.banners[index], height: 50),
                  );
                },
              ),
            ),

            const Gap(5),

            /// 🔹 Indicators
            AnimatedBuilder(
              animation: viewmodel,
              builder: (context, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    viewmodel.banners.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
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
                  ),
                );
              },
            ),

            const Gap(5),

            /// 🔹 Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: List.generate(3, (index) => CatigoryCard())),
            ),

            const Gap(5),

            /// 🔹 Sellers header
            Row(
              children: [
                CustomText(title: "Sellers", size: 18),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text("Show all")),
              ],
            ),

            const Gap(5),

            /// 🔥 الجزء القابل للسكرول
            Expanded(
              child: isLandscape
                  ? GridView.builder(
                      itemCount: 18,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 3.8,
                          ),
                      itemBuilder: (context, index) {
                        return SellerCard(
                          name: "Seller name",
                          image: 'assets/5.png',
                          description: 'Delivery Charges : 0.5 KD',
                          state: 'Open',
                          product: 'Pizza',
                          rate: '4.5',
                          distance: '2.5 KM',
                        );
                      },
                    )
                  : ListView.separated(
                      itemCount: 18,
                      separatorBuilder: (context, index) => const Gap(8),
                      itemBuilder: (context, index) {
                        return SellerCard(
                          name: "Seller name",
                          image: 'assets/5.png',
                          description: 'Delivery Charges : 0.5 KD',
                          state: 'Open',
                          product: 'Pizza',
                          rate: '4.5',
                          distance: '2.5 KM',
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
