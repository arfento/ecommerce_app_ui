import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app_ui/common/constants.dart';
import 'package:ecommerce_app_ui/common/styles/app_colors.dart';
import 'package:ecommerce_app_ui/config/themes/custom_themes.dart';
import 'package:ecommerce_app_ui/data/models/base_model.dart';
import 'package:ecommerce_app_ui/presentation/pages/details_page.dart';
import 'package:ecommerce_app_ui/presentation/widgets/main_content_view_widget.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app_ui/common/indicator_component.dart';
import 'package:ecommerce_app_ui/common/main_wrapper.dart';
import 'package:ecommerce_app_ui/common/see_all_text_widget.dart';
import 'package:ecommerce_app_ui/common/reuseable_text.dart';
import 'package:ecommerce_app_ui/common/styles/sizes.dart';
import 'package:ecommerce_app_ui/data/models/tab_bar_model.dart';
import 'package:ecommerce_app_ui/presentation/pages/cart_page.dart';
import 'package:ecommerce_app_ui/presentation/pages/search_page.dart';
import 'package:ecommerce_app_ui/presentation/widgets/tab_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  bool isSearchActive = false;
  final int _index = 0;
  late PageController _mainPageController;
  final int _currentIndexMainPage = 2;

  List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
  ];
  @override
  void initState() {
    super.initState();
    isSearchActive = false;
    tabController = TabController(length: 3, vsync: this);
    _mainPageController = PageController(
        initialPage: _currentIndexMainPage, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    super.dispose();
    _mainPageController.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(size),
        body: !isSearchActive
            ? ContentHomePage(
                size: size,
                tabController: tabController,
                pageController: _mainPageController,
              )
            : const SearchPage(),
      ),
    );
  }

  PreferredSize _buildAppBar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.09),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              // const Icon(
              //   Icons.menu,
              //   color: Colors.black,
              // ),
              // SizedBox(
              //   width: 10,
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 5,
                  ),
                  child: GestureDetector(
                    onTap: (() => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainWrapper()))),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/main.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearchActive = !isSearchActive;
                });
              },
              icon: isSearchActive
                  ? const Icon(
                      Icons.search_off_outlined,
                      color: Colors.black,
                      size: 30,
                    )
                  : const Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 5,
              ),
              child: GestureDetector(
                onTap: (() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainWrapper()))),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/main.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentHomePage extends StatelessWidget {
  final Size size;
  final TabController tabController;
  final PageController pageController;
  const ContentHomePage({
    Key? key,
    required this.size,
    required this.tabController,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.hPadding10,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: const AppText(
                  text: "Top Tours",
                  size: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: const AppText(
                  text: "For Your Request",
                  size: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: size.width,
                  height: size.height * 0.4,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    itemCount: mainList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const DetailsPage(
                                    // data: mainList[index],
                                    // isCameFromMostPopularPart: false,

                                    );
                              },
                            ),
                          );
                        },
                        child: MainContentViewWidget(
                          data: mainList[index],
                          index: index,
                          pageController: pageController,
                          size: size,
                        ),
                      );
                    },
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 600),
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: size.width,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      labelPadding: EdgeInsets.only(
                          left: size.width * 0.05, right: size.width * 0.05),
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const CircleTabBarIndicator(
                        color: Colors.deepPurpleAccent,
                        radius: 4,
                      ),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(text: "Inspiration"),
                        Tab(text: "Popular"),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  width: size.width,
                  height: size.height * 0.3,
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        TabViewWidget(
                          list: places,
                        ),
                        TabViewWidget(list: inspiration),
                        TabViewWidget(list: popular),
                      ]),
                ),
              ),
              //see all most popular
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: const SeeAllTextWidget(text: "Most Popular"),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 900),
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  width: size.width,
                  height: size.height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mainList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: size.width * 0.2,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    mainList[index].imageUrl,
                                  ),
                                ),
                              ),
                            ),
                            AppText(
                              text: mainList[index].name,
                              size: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        );
                      }),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: const SeeAllTextWidget(text: "Find More"),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 900),
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  width: size.width,
                  height: size.height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: size.width * 0.2,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    categories[index].imageUrl,
                                  ),
                                ),
                              ),
                            ),
                            AppText(
                              text: categories[index].title,
                              size: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        );
                      }),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: const SeeAllTextWidget(text: "Popular Product"),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: size.width,
                  height: size.height * 0.3,
                  child: GridView.builder(
                    itemCount: mainList.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      BaseModel current = mainList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                return const DetailsPage(
                                    //  data: current,
                                    //       isCameFromMostPopularPart: true,
                                    );
                              },
                            ),
                          );
                        },
                        child: Hero(
                            tag: current.imageUrl,
                            child: Column(
                              children: [
                                Container(
                                  width: size.width * 0.5,
                                  height: size.height * 0.3,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    image: DecorationImage(
                                      image: AssetImage(current.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Color.fromARGB(61, 0, 0, 0),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    current.name,
                                    style: AppThemes.homeProductName.copyWith(
                                      color: AppColors.hideGray,
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "€".toString(),
                                      style:
                                          AppThemes.homeProductModel.copyWith(
                                        color: AppColors.lightBlueSky,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: current.price.toString(),
                                          style: AppThemes.homeProductModel
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
