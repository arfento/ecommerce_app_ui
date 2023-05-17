import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app_ui/common/constants.dart';
import 'package:ecommerce_app_ui/common/main_wrapper.dart';
import 'package:ecommerce_app_ui/common/styles/app_colors.dart';
import 'package:ecommerce_app_ui/config/themes/custom_themes.dart';
import 'package:ecommerce_app_ui/data/models/base_model.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void onDelete(BaseModel data) {
    setState(() {
      if (itemsOnFavorit.length == 1) {
        itemsOnFavorit.clear();
      } else {
        itemsOnFavorit.removeWhere((element) => element.id == data.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SizedBox(
          width: size.width,
          height: size.height * 0.3,
          child: itemsOnFavorit.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      child: const Image(
                        image: AssetImage("assets/images/empty.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    FadeInUp(
                      child: const Text(
                        'Your favorite is empty right now :(',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: itemsOnFavorit.length,
                  itemBuilder: (context, index) {
                    var current = itemsOnFavorit[index];
                    return FadeInUp(
                      delay: Duration(milliseconds: 100 * index + 80),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: size.width,
                        height: size.height * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Color.fromARGB(61, 0, 0, 0),
                                  )
                                ],
                                color: Colors.pink,
                                image: DecorationImage(
                                    image: AssetImage(current.imageUrl),
                                    fit: BoxFit.cover),
                              ),
                              width: size.width * 0.4,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.52,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          current.name,
                                          style: AppThemes.cartProductModel
                                              .copyWith(fontSize: 20),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            onDelete(current);
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: AppColors.darkGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "€",
                                      style: AppThemes.cartProductPrice,
                                      children: [
                                        TextSpan(
                                          text: current.price.toString(),
                                          style: AppThemes.cartProductPrice,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "My Favorite",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_forever_rounded,
            color: AppColors.darkTextColor,
          ),
        ),
      ],
    );
  }
}
