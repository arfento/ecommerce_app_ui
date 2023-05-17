import 'package:ecommerce_app_ui/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  /// Home
  static const TextStyle homeAppBar = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.darkTextColor,
  );
  static const TextStyle homeProductName = TextStyle(
    color: AppColors.lightTextColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle homeProductModel = TextStyle(
      color: AppColors.lightTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 22);
  static const TextStyle homeProductPrice = TextStyle(
      color: AppColors.lightTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 16);
  static const TextStyle homeMoreText = TextStyle(
      fontSize: 22,
      color: AppColors.darkTextColor,
      fontWeight: FontWeight.bold);
  static const TextStyle homeGridNewText = TextStyle(
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle homeGridNameAndModel = TextStyle(
    color: AppColors.darkTextColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle homeGridPrice = TextStyle(
    color: AppColors.darkTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle commonText = TextStyle(
    color: AppColors.darkTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// Details
  static const TextStyle detailsPageTitle = TextStyle(
    color: AppColors.darkTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  static const TextStyle detailsPageBody = TextStyle(
    color: AppColors.darkTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static const TextStyle detailsMoreText = TextStyle(
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      height: 1);
  static const TextStyle detailsProductPrice = TextStyle(
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      height: 1);
  static TextStyle detailsProductDescriptions =
      TextStyle(color: Colors.grey[600]);

  /// Bag

  static const TextStyle cartEmptyListTitle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);
  static const TextStyle cartEmptyListSubTitle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w400);
  static const TextStyle cartTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );
  static const TextStyle cartTotal = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );
  static const TextStyle cartProductModel = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.darkTextColor,
  );
  static const TextStyle cartProductPrice = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkTextColor,
  );
  static const TextStyle cartProductNumOfProduct =
      TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  static const TextStyle cartTotalPrice = TextStyle(
      color: AppColors.darkTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 16);
  static const TextStyle cartSumOfItemOnBag = TextStyle(
      color: AppColors.darkTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 20);

  /// Profile
  static const TextStyle profileAppBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkTextColor,
  );
  static const TextStyle profileRepeatedListTileTitle = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.darkTextColor,
      fontSize: 18);
  static const TextStyle profileDevName =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w800);
}
