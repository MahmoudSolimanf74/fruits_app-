import 'package:flutter/material.dart';
import 'package:fruits_app/features/trackorder/models/step_model.dart';

class TrackViewmodel extends ChangeNotifier {

  final List<OrderStep> steps = [
  OrderStep(
    name: "Order Placed",
    date: "10 Sep 2021",
    isDone: true,
  ),
  OrderStep(
    name: "Order Confirmed",
    date: "10 Sep 2021",
    isDone: true,
  ),
  OrderStep(
    name: "Packed",
    date: "11 Sep 2021",
    isDone: true,
  ),
  OrderStep(
    name: "Out for Delivery",
    date: "12 Sep 2021",
    isDone: false,
  ),
  OrderStep(
    name: "Delivered",
    date: "Estimated for 13 Sep 2021",
    isDone: false,
  ),
];

}