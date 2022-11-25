import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/services/api_handler.dart';

import '../Models/products_model.dart';
import '../widgets/feedsWidget.dart';

class feedsScreen extends StatefulWidget {
  @override
  State<feedsScreen> createState() => _feedsScreenState();
}

class _feedsScreenState extends State<feedsScreen> {
  List<product> productList = [];
  int limit = 10;
  // bool _isLoading = false;
  bool _isLimit = false;
  final ScrollController scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    getProducts();
    scrollController.addListener(() async {
      if (limit == 100) {
        _isLimit = true;
        setState(() {});
        return;
      }
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // _isLoading = true;
        limit += 10;

        log('limit ${limit}');
        await getProducts();
        // _isLoading = false;
      }
    });
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await ApiHandler.getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: productList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // controller: scrollController,
                      itemCount: productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, ind) {
                        return ChangeNotifierProvider.value(
                          value: productList[ind],
                          child: feedsWidget(

                              // title: productList[ind].title.toString(),
                              // imageUrl: productList[ind].images![0]
                              ),
                        );
                      }),
                  if (!_isLimit)
                    Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              ),
            ),
    );
  }
}
