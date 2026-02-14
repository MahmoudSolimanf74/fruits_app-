import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/home_viewmodel.dart';
import 'package:fruits_app/features/Home/widgets/catigory_card.dart';
import 'package:fruits_app/features/Home/widgets/seller_card.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final PersistentTabController? controller;
  const HomeScreen({super.key,this.controller});

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
                  return Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primarycolor,
                      ),
                      width: 350,
                      height: 350,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: .center,
                            children: [Text("data")],
                          ),
                          Row(
                            children: [Text("data"), Icon(Icons.abc_outlined)],
                          ),
                          TextField(),
                          SelectionArea(child: Text("ssdssdds")),
                        ],
                      ),
                    ),
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
