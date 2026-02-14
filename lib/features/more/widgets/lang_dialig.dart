import 'package:flutter/material.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:gap/gap.dart';

class LangDialig extends StatelessWidget {
  const LangDialig({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
                  child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 12,
                      ),
                      child: Column(
                        children: [
                          Text("عربي"),
                          Text("ُEnglish"),
                          Spacer(),
                          CustomButton(text: "Apply"),
                          Gap(6),
                          TextButton(
                            onPressed: () => MyNavigator.pop(context),
                            child: Text("Close"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
  }
}