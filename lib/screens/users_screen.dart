import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Models/user_model.dart';
import 'package:store_app/services/api_handler.dart';
import 'package:store_app/widgets/users_widget.dart';

class userScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: FutureBuilder<List<users>>(
            future: ApiHandler.getAllUsers(),
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
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, ind) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![ind], child: userWidget());
                  });
            }));
  }
}
