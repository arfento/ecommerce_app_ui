import 'package:ecommerce_app_ui/common/styles/app_colors.dart';
import 'package:ecommerce_app_ui/common/styles/sizes.dart';
import 'package:ecommerce_app_ui/config/themes/custom_themes.dart';
import 'package:flutter/material.dart';

class CustomAppbarProfile extends StatelessWidget {
  const CustomAppbarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: EdgeInsets.only(top: Sizes.smallPadding),
        child: const Text(
          "My Profile",
          style: AppThemes.profileAppBarTitle,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            top: Sizes.smallPadding,
            right: Sizes.smallestPadding,
          ),
          child: const Icon(
            Icons.more_vert,
            color: AppColors.darkTextColor,
          ),
        ),
      ],
    );
  }
}
