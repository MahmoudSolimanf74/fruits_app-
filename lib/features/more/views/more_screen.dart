import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/root_viewmodel.dart';
import 'package:fruits_app/features/auth/views/login_page.dart';
import 'package:fruits_app/features/more/views/contact_us.dart';
import 'package:fruits_app/features/more/views/profile_screen.dart';
import 'package:fruits_app/features/more/views/terms_and_conditions.dart';
import 'package:fruits_app/features/more/widgets/custom_row.dart';
import 'package:fruits_app/features/more/widgets/lang_dialig.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MoreScreen extends StatelessWidget {
  final PersistentTabController? controller;
  const MoreScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Fruits Market",
          size: 24,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Divider(),
              Gap(20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greycolor),
                  shape: .circle,
                ),
                width: 90,
                height: 90,
                child: Icon(Icons.person_2_outlined, size: 50),
              ),
              Text("Welcome, Fruit Market", style: TextStyle(fontSize: 25)),
              Gap(10),
              CustomButton(
                text: "Login",
                ontap: () => MyNavigator.gototrack(context, LoginPage()),
              ),
              Gap(20),
              CustomRow(
                icon: Icons.person,
                name: "profile",
                ontap: () => MyNavigator.goto(context, ProfileScreen()),
              ),
              CustomRow(
                icon: Icons.format_list_numbered_rounded,
                name: "My Orders",
                ontap: () => RootTabController.goToTab(1),
              ),
              CustomRow(
                icon: Icons.favorite_border,
                name: "Favorite",
                ontap: () => RootTabController.goToTab(3),
              ),
              CustomRow(
                icon: Icons.language,
                name: "language",
                ontap: () => showDialog(
                  context: context,
                  builder: (context) => LangDialig(),
                ),
              ),
              CustomRow(
                icon: Icons.headphones,
                name: "Support",
                ontap: () => MyNavigator.goto(context, ContactUs()),
              ),
              CustomRow(
                icon: Icons.handshake,
                name: "Terms & Conditions",
                ontap: () => MyNavigator.goto(context, TermsAndConditions()),
              ),
              CustomRow(icon: Icons.error_outline, name: "About Us"),
            ],
          ),
        ),
      ),
    );
  }
}
