import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:fruits_app/utils/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Contact Us",
          size: 24,
          color: AppColors.secondarycolor,
          fontWeights: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              CustomTextField(text: "Name", hintText: "your name ..."),
              Gap(5),
              CustomTextField(text: "mobile number", hintText: ""),
              Gap(5),

              CustomTextField(text: "Message", hintText: ""),
              Gap(25),
              CustomButton(text: "Submit", width: double.infinity),
              Gap(20),
              Row(
                crossAxisAlignment: .center,
                children: [Icon(Icons.facebook)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
