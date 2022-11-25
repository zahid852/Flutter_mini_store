import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/Models/products_model.dart';
import 'package:store_app/consts/global_colors.dart';

class ProductsDetail extends StatefulWidget {
  ProductsDetail({Key? key, required this.ProductModel}) : super(key: key);
  final product ProductModel;

  @override
  State<ProductsDetail> createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  final titleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            BackButton(),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ProductModel.Category!.name.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Text(
                            widget.ProductModel.title.toString(),
                            style: titleStyle,
                          )),
                      Flexible(
                          flex: 1,
                          child: RichText(
                              text: TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                  children: [
                                TextSpan(
                                    text: widget.ProductModel.price.toString(),
                                    style: TextStyle(
                                        color: lightTextColor,
                                        fontWeight: FontWeight.bold))
                              ])))
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            Container(
              child: SizedBox(
                height: size.height * 0.4,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0
                      // size.width * 0.1
                      ),
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      return FancyShimmerImage(
                        imageUrl: widget.ProductModel.images![index],
                        errorWidget: Icon(
                          IconlyBold.danger,
                          color: Colors.red,
                          size: 28,
                        ),
                      );
                    },
                    autoplay: true,
                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeColor: Colors.red, color: Colors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    widget.ProductModel.description.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
