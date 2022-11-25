import 'package:flutter/material.dart';

class appBarIcons extends StatelessWidget {
  final Function function;
  final IconData icon;
  appBarIcons({required this.function, required this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).cardColor),
          padding: EdgeInsets.all(6),
          child: Icon(icon),
        ),
      ),
    );
  }
}
