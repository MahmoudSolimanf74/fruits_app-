import 'package:flutter/material.dart';
import 'package:fruits_app/features/basket/viewmodel/checkout_viewmodel.dart';
import 'package:fruits_app/features/basket/widget/delivery_card.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:gap/gap.dart';

class DeliveryTime extends StatefulWidget {
  final CheckoutViewmodel viewmodel;
  const DeliveryTime({super.key, required this.viewmodel});

  @override
  State<DeliveryTime> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryTime> {
  @override
  Widget build(BuildContext context) {
    var viewmodel = widget.viewmodel;
    return AnimatedBuilder(
      animation: viewmodel,
      builder: (context, _) {
        return Column(
          children: [
            DeliveryOptionCard(
              title: "Now",
              selected: viewmodel.deliveryNow,
              onTap: viewmodel.selectDelivary,
              content: const SizedBox(),
            ),

            Gap(30),
            DeliveryOptionCard(
              title: "Select Delivery Time",
              selected: viewmodel.selectDeliveryTime,
              onTap: viewmodel.selectDelivary,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select date"),
                  const Gap(8),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Date / Time",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(100),
            CustomButton(
              text: "Continue",
              width: double.infinity,
              ontap: () => viewmodel.nextPage(),
            ),
          ],
        );
      },
    );
  }
}
