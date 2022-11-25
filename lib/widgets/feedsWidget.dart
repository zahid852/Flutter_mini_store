import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Models/products_model.dart';
import 'package:store_app/consts/global_colors.dart';
import 'package:store_app/screens/products_details.dart';
import 'package:store_app/services/api_handler.dart';

class feedsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<product>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(2),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(PageTransition(
                child: ProductsDetail(ProductModel: productProvider),
                type: PageTransitionType.fade));
          },
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: RichText(
                            text: TextSpan(
                                text: '\$',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                                children: [
                          TextSpan(
                              text: "${productProvider.price}",
                              style: TextStyle(
                                  color: lightTextColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600))
                        ]))),
                    Icon(IconlyBold.heart)
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FancyShimmerImage(
                  imageUrl: productProvider.images![0],
                  height: size.height * 0.2,
                  errorWidget: Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                  ),
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      productProvider.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
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
