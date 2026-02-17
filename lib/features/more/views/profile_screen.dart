import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      shape: .circle,
                    ),
                    width: 90,
                    height: 90,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        shape: .circle,
                        color: AppColors.primarycolor,
                      ),
                      width: 40,
                      height: 40,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                text: "Full Name",
                hintText: "First and last name",
              ),
              CustomTextField(
                text: "Phone number with whatsapp",
                hintText: "mobile number",
              ),
              CustomTextField(text: "password", hintText: "Password"),
              Gap(20),
              CustomButton(text: "Update"),
            ],
          ),
        ),
      ),
    );
  }
}
