import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Models/categories_model.dart';
import 'package:store_app/services/api_handler.dart';
import 'package:store_app/widgets/category_widget.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: FutureBuilder<List<category>>(
            future: ApiHandler.getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('An error occured ${snapshot.error}'));
              } else if (snapshot.data == null) {
                return Center(child: Text('No categories has been added yet.'));
              }
              return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2),
                  itemBuilder: (context, ind) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![ind], child: categoryWidget());
                  });
            }));
  }
}
