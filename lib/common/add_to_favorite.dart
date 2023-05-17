import 'package:advance_notification/advance_notification.dart';
import 'package:ecommerce_app_ui/common/constants.dart';
import 'package:ecommerce_app_ui/data/models/base_model.dart';
import 'package:flutter/material.dart';

class AddToFavorite {
  static void addToFavorite(
      {required BaseModel data, required BuildContext context}) {
    bool contains = itemsOnFavorit.contains(data);

    if (contains == true) {
      const AdvanceSnackBar(
        textSize: 14,
        bgColor: Colors.red,
        message: "You have added this item to favorite before",
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    } else {
      itemsOnFavorit.add(data);

      const AdvanceSnackBar(
        textSize: 14,
        message: "Successfully added to your favorite",
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }
}
