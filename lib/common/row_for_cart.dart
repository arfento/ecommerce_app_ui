import 'package:ecommerce_app_ui/config/themes/custom_themes.dart';
import 'package:flutter/material.dart';

class RowForCart extends StatelessWidget {
  const RowForCart({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  final double price;
  final String text;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppThemes.commonText.copyWith(color: Colors.grey)),
          RichText(
            text: TextSpan(
              text: "€",
              style: AppThemes.cartProductPrice,
              children: [
                TextSpan(
                  text: price.toString(),
                  style: AppThemes.commonText.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
