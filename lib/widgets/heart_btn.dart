import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/services/utils.dart';

class HeartBTN extends StatelessWidget {
  const HeartBTN({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    return GestureDetector(
      onTap: () {
        print("Press Hart Button");
      },
      child: Icon(
        IconlyLight.heart,
        size: 25,
        color: color,
      ),
    );
  }
}
