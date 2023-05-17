// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app_ui/common/add_to_cart.dart';
import 'package:ecommerce_app_ui/common/add_to_favorite.dart';
import 'package:ecommerce_app_ui/common/constants.dart';
import 'package:ecommerce_app_ui/common/reusable_button.dart';
import 'package:ecommerce_app_ui/common/styles/app_colors.dart';
import 'package:ecommerce_app_ui/config/themes/custom_themes.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app_ui/data/models/base_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final BaseModel data;

  @override
  State<DetailsPage> createState() {
    return _DetailsPageState();
  }
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedSize = 3;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    BaseModel current = widget.data;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.width * 0.5,
              child: Stack(
                children: [
                  Hero(
                    tag: current.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(
                          image: AssetImage(current.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.12,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: AppColors.gradient),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            current.name,
                            style: AppThemes.detailsPageTitle,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "€",
                              style: AppThemes.detailsPageTitle.copyWith(
                                color: AppColors.lightOrange,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: current.price.toString(),
                                  style: AppThemes.detailsPageTitle,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: AppColors.lightOrange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            current.star.toString(),
                            style: AppThemes.commonText,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "(${current.review.toString()}K+ review)",
                            style: AppThemes.commonText
                                .copyWith(color: AppColors.grey),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            //size
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
                child: Text(
                  "Select Size",
                  style: AppThemes.detailsPageTitle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    var sizeSelected = sizes[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                            color: selectedSize == index
                                ? AppColors.lightOrange
                                : Colors.transparent,
                            border: Border.all(
                                color: AppColors.lightOrange, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              sizeSelected,
                              style: AppThemes.commonText.copyWith(
                                  color: selectedSize == index
                                      ? AppColors.white
                                      : AppColors.darkTextColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
                child: Text(
                  "Select Color",
                  style: AppThemes.detailsPageTitle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    var colorSelected = colors[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                            color: colorSelected,
                            border: Border.all(
                              color: selectedColor == index
                                  ? AppColors.darkTextColor
                                  : Colors.transparent,
                              width: selectedColor == index ? 3 : 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: ReuseableButton(
                  text: "Add to cart",
                  onTap: () {
                    AddToCart.addToCart(
                      data: current,
                      context: context,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.darkGray,
      actions: [
        IconButton(
          onPressed: () {
            print("widget data : ${widget.data}");
            AddToFavorite.addToFavorite(
              data: widget.data,
              context: context,
            );
          },
          icon: const Icon(Icons.favorite_border),
          color: AppColors.white,
        )
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
        color: AppColors.white,
      ),
    );
  }
}
