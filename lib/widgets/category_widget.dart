import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Models/categories_model.dart';
import 'package:store_app/Models/products_model.dart';
import 'package:store_app/consts/global_colors.dart';

class categoryWidget extends StatelessWidget {
  const categoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoryProvider = Provider.of<category>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              imageUrl: categoryProvider.image!,
              // height: size.height * 0.2,
              errorWidget: Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              width: size.width * 0.48,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                categoryProvider.name.toString(),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    backgroundColor: lightCardColor.withOpacity(0.5)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
