import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomRow extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function()? ontap;
  const CustomRow({
    super.key,
    required this.icon,
    required this.name,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            Icon(icon),
            Gap(10),
            Text(name),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
}
