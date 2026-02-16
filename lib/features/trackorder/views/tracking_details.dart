import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/root_viewmodel.dart';
import 'package:fruits_app/features/trackorder/viewmodel/track_viewmodel.dart';
import 'package:fruits_app/features/trackorder/widgets/delivery_steps.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:fruits_app/utils/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class TrackingDetails extends StatelessWidget {
  const TrackingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TrackViewmodel viewmodel = TrackViewmodel();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Order tracking",
          size: 24,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: .center,
            children: [
              CustomText(title: "Your Order Code: #882610", size: 14),
              CustomText(title: "3 items - 37.50 KD", size: 14),
              CustomText(title: "Payment Method : Cash", size: 14),
              Gap(50),
              SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: .center,
                  children: [
                    ...List.generate(
                      viewmodel.steps.length,
                      (index) => DeliverySteps(
                        name: viewmodel.steps[index].name,
                        date: viewmodel.steps[index].date,
                        isDone: viewmodel.steps[index].isDone,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30),
              CustomButton(
                ontap: () {
                  MyNavigator.clean(context);
                  RootTabController.goToTab(0);
                },
                text: "Confirm",
                width: double.infinity,
              ),
              Gap(10),
              CustomButton(
                text: "Cancel Order",
                width: double.infinity,
                boxColor: AppColors.redcolor,
                ontap: () => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primarycolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 8,
                        ),
                        child: Column(
                          children: [
                            CustomText(title: "Cancel Order", size: 18),
                            Gap(10),
                            CustomTextField(
                              text: "Reason",
                              hintText: "plase reason",
                            ),
                            Gap(10),
                            CustomTextField(text: "note", hintText: ""),
                            Gap(20),
                            CustomButton(
                              text: "Confirm cancelation",
                              ontap: () {
                                MyNavigator.clean(context);
                                RootTabController.goToTab(0);
                              },
                            ),
                            CustomButton(
                              text: "Colse",
                              boxColor: Colors.transparent,
                              color: AppColors.blackcolor,
                              ontap: () => MyNavigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
