import 'package:advance_notification/advance_notification.dart';
import 'package:ecommerce_app_ui/common/constants.dart';
import 'package:ecommerce_app_ui/data/models/base_model.dart';
import 'package:flutter/material.dart';

class AddToCart {
  static void addToCart(
      {required BaseModel data, required BuildContext context}) {
    bool contains = itemsOnCart.contains(data);

    if (contains == true) {
      const AdvanceSnackBar(
        textSize: 14,
        bgColor: Colors.red,
        message: "You have added this item to cart before",
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    } else {
      itemsOnCart.add(data);

      const AdvanceSnackBar(
        textSize: 14,
        message: "Successfully added to your cart",
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }
}
