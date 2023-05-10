// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app_ui/common/styles/app_colors.dart';
import 'package:ecommerce_app_ui/config/themes/custom_themes.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app_ui/data/models/base_model.dart';

class MainContentViewWidget extends StatelessWidget {
  final BaseModel data;
  final int index;
  final Size size;
  final PageController pageController;

  const MainContentViewWidget({
    Key? key,
    required this.data,
    required this.index,
    required this.size,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 0.0;
        if (pageController.position.haveDimensions) {
          value = index.toDouble() - (pageController.page ?? 0);
          value = (value * 0.04).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: 3.14 * value,
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: data.id,
                  child: Container(
                    width: size.width * 0.6,
                    height: size.height * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                        image: AssetImage(data.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Color.fromARGB(61, 0, 0, 0))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    data.name,
                    style: AppThemes.homeProductName.copyWith(
                      color: AppColors.hideGray,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "€".toString(),
                      style: AppThemes.homeProductModel.copyWith(
                        color: AppColors.lightBlueSky,
                      ),
                      children: [
                        TextSpan(
                          text: data.price.toString(),
                          style: AppThemes.homeProductModel.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
