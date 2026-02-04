import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/views/login_screen.dart';
import 'package:fruits_app/features/onboard/viewmodel/onboard_viewmodel.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final viewModel = OnboardViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: viewModel.pageController,
        itemCount: viewModel.onboardItems.length,
        onPageChanged: viewModel.onPageChanged,
        itemBuilder: (context, index) {
          var length = viewModel.onboardItems.length;
          final item = viewModel.onboardItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                const Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedBuilder(
                      animation: viewModel.pageController,
                      builder: (context, child) {
                        int pageIndex = viewModel.pageController.hasClients
                            ? viewModel.pageController.page?.round() ?? 0
                            : 0;

                        return TextButton(
                          onPressed: viewModel.skip,
                          child: pageIndex < viewModel.onboardItems.length - 1
                              ? CustomText(title: "Skip", size: 14)
                              : const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
                const Gap(60),
                Image.asset(item.image),
                const Gap(30),
                CustomText(
                  title: item.title,
                  size: 18,
                  fontWeights: FontWeight.bold,
                ),
                const Gap(10),
                CustomText(title: item.subtitle, size: 17),
                const Gap(60),
                // Indicators
                AnimatedBuilder(
                  animation: viewModel.pageController,
                  builder: (context, _) {
                    double page = 0;
                    try {
                      page =
                          viewModel.pageController.page ??
                          viewModel.currentIndex.toDouble();
                    } catch (_) {
                      page = viewModel.currentIndex.toDouble();
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        viewModel.onboardItems.length,
                        (i) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.secondarycolor),
                            color: page.round() == i
                                ? AppColors.secondarycolor
                                : AppColors.primarycolor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Gap(20),
                CustomButton(
                  text: item.buttontext,
                  ontap: () {
                    if (viewModel.currentIndex < length - 1) {
                      viewModel.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      MyNavigator.goToReplacement(context, LoginScreen());
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
