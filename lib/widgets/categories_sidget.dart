import 'package:flutter/material.dart';
import 'package:fshop2/inner_screens/cat_screen.dart';
import 'package:fshop2/screens/categories_screen.dart';
import 'package:provider/provider.dart';

import 'package:fshop2/provider/dark_theme_provider.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class CategoriesWiget extends StatelessWidget {
  final String catText, imgPath;
  final Color passedcolor;
  CategoriesWiget({
    Key? key,
    required this.imgPath,
    required this.catText,
    required this.passedcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    Size size = MediaQuery.of(context).size;
    double _ScreenWidth = size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryScreen.routeName,
            arguments: catText);
      },
      child: Container(
        decoration: BoxDecoration(
          color: passedcolor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedcolor.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: _ScreenWidth * 0.3,
              width: _ScreenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextWidget(
              text: catText,
              color: color,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
