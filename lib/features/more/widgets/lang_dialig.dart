import 'package:flutter/material.dart';
import 'package:fruits_app/features/more/viewmodel/lang_viewmodel.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class LangDialig extends StatefulWidget {
  const LangDialig({super.key});

  @override
  State<LangDialig> createState() => _LangDialigState();
}

class _LangDialigState extends State<LangDialig> {
  LangViewmodel viewmodel = LangViewmodel();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() => viewmodel.chosearabicLang());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: .circle,
                        border: Border.all(),
                      ),
                      width: 25,
                      height: 25,
                      child: viewmodel.arabicLang ? Icon(Icons.check) : null,
                    ),
                  ),
                  Gap(5),
                  CustomText(title: "العربيه", size: 18),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() => viewmodel.choseenglishLang());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: .circle,
                        border: Border.all(),
                      ),
                      width: 25,
                      height: 25,
                      child: viewmodel.englishLang ? Icon(Icons.check) : null,
                    ),
                  ),
                  Gap(5),
                  CustomText(title: "Englist", size: 18),
                ],
              ),
              Spacer(),
              CustomButton(
                text: "Apply",
                ontap: () => MyNavigator.pop(context),
              ),
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
