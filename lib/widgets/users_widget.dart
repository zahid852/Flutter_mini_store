import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Models/user_model.dart';
import 'package:store_app/consts/global_colors.dart';

class userWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<users>(context);
    return ListTile(
      leading: FancyShimmerImage(
        imageUrl: userProvider.avatar.toString(),
        height: size.height * 0.15,
        errorWidget: Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        width: size.width * 0.15,
      ),
      title: Text(userProvider.name.toString()),
      subtitle: Text(userProvider.email.toString()),
      trailing: Text(
        userProvider.role.toString(),
        style: TextStyle(color: lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
