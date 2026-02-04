import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(150),
          Row(
            children: [
              Text("data"),
              Spacer(),
              Icon(Icons.abc_outlined),
              Icon(Icons.abc_outlined),
            ],
          ),
          PageView(),
          Row(),
          Column(),
        ],
      ),
    );
  }
}
