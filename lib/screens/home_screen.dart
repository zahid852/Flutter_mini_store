import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Models/products_model.dart';
import 'package:store_app/consts/global_colors.dart';
import 'package:store_app/screens/category_screen.dart';
import 'package:store_app/screens/feeds_screen.dart';
import 'package:store_app/screens/users_screen.dart';
import 'package:store_app/services/api_handler.dart';
import 'package:store_app/widgets/app_bar_icons.dart';
import 'package:store_app/widgets/feedsWidget.dart';
import 'package:store_app/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEdidtingController;
  // List<product> productList = [];
  @override
  void initState() {
    _textEdidtingController = TextEditingController();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }

  // Future<void> getProducts() async {
  //   productList = await ApiHandler.getAllProducts();
  //   setState(() {});
  // }

  @override
  void dispose() {
    _textEdidtingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          leading: appBarIcons(
              function: () {
                Navigator.of(context).push(PageTransition(
                    child: categoryScreen(), type: PageTransitionType.fade));
              },
              icon: IconlyBold.category),
          actions: [
            appBarIcons(
                function: () {
                  Navigator.of(context).push(PageTransition(
                      child: userScreen(), type: PageTransitionType.fade));
                },
                icon: IconlyBold.user3)
          ],
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEdidtingController,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Theme.of(context).cardColor)),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary))),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.2,
                          child: Swiper(
                            itemCount: 3,
                            itemBuilder: (ctx, index) {
                              return saleWidget();
                            },
                            pagination: SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                    activeColor: Colors.red,
                                    color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Row(
                            children: [
                              Text(
                                'Latest Products',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Spacer(),
                              appBarIcons(
                                  function: () {
                                    Navigator.of(context).push(PageTransition(
                                        child: feedsScreen(),
                                        type: PageTransitionType.fade));
                                  },
                                  icon: IconlyBold.arrowRight2)
                            ],
                          ),
                        ),
                        FutureBuilder<List<product>>(
                            future: ApiHandler.getAllProducts(limit: '3'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 100),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text(
                                        'An error occured ${snapshot.error}'));
                              } else if (snapshot.data == null) {
                                return Center(
                                    child: Text(
                                        'No products has been added yet.'));
                              }
                              return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5,
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7),
                                  itemBuilder: (context, ind) {
                                    return ChangeNotifierProvider.value(
                                        value: snapshot.data![ind],
                                        child: feedsWidget());
                                  });
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
