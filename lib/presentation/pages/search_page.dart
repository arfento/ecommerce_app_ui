import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app_ui/common/add_to_cart.dart';
import 'package:ecommerce_app_ui/common/constants.dart';
import 'package:ecommerce_app_ui/common/styles/app_colors.dart';
import 'package:ecommerce_app_ui/config/themes/custom_themes.dart';
import 'package:ecommerce_app_ui/data/models/base_model.dart';
import 'package:ecommerce_app_ui/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchCtrl;
  late List<BaseModel> listItemOnSearch;
  @override
  void initState() {
    super.initState();
    listItemOnSearch = mainList;
    searchCtrl = TextEditingController();
  }

  onSearch(String search) {
    setState(() {
      listItemOnSearch = mainList
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {},
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: <Widget>[
                FadeInUp(
                  delay: const Duration(milliseconds: 50),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: SizedBox(
                      height: size.height * 0.07,
                      width: size.width,
                      child: TextField(
                        controller: searchCtrl,
                        onChanged: (value) {
                          onSearch(value);
                        },
                        style: AppThemes.commonText,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          filled: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchCtrl.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                listItemOnSearch = mainList;
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                          hintStyle: AppThemes.commonText
                              .copyWith(color: AppColors.grayWhite),
                          hintText: "Search an item",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Expanded(
                  child: listItemOnSearch.isNotEmpty
                      ? GridView.builder(
                          itemCount: listItemOnSearch.length,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                          ),
                          itemBuilder: (context, index) {
                            BaseModel current = listItemOnSearch[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      return DetailsPage(
                                        data: current,
                                        //       isCameFromMostPopularPart: true,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Hero(
                                  tag: current.imageUrl,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: size.height * 0.02,
                                        left: size.width * 0.01,
                                        right: size.width * 0.01,
                                        child: Container(
                                          width: size.width * 0.5,
                                          height: size.height * 0.3,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage(current.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                                color:
                                                    Color.fromARGB(61, 0, 0, 0),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: size.height * 0.04,
                                        child: Text(
                                          current.name,
                                          style: AppThemes.homeProductName
                                              .copyWith(
                                            color: AppColors.hideGray,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: size.height * 0.01,
                                        child: RichText(
                                          text: TextSpan(
                                              text: "€".toString(),
                                              style: AppThemes.homeProductModel
                                                  .copyWith(
                                                color: AppColors.lightOrange,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      current.price.toString(),
                                                  style: AppThemes
                                                      .homeProductModel
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Positioned(
                                        top: size.height * 0.01,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          child: IconButton(
                                            onPressed: () {
                                              AddToCart.addToCart(
                                                data: current,
                                                context: context,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.shopping_cart_checkout,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          },
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            FadeInUp(
                              delay: const Duration(milliseconds: 200),
                              child: const Image(
                                image:
                                    AssetImage("assets/images/search_fail.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            FadeInUp(
                              child: const Text(
                                'No Result Found :(',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
