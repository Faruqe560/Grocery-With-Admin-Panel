import 'package:flutter/material.dart';
import 'package:fshop2/provider/dark_theme_provider.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/categories_sidget.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = "/CategoriesScreen";
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Map<String, dynamic>> catInfo = [
    {
      "imgPath": "assets/images/cat/fruits.png",
      "catText": "fruits",
    },
    {
      "imgPath": "assets/images/cat/veg.png",
      "catText": "Vegetables",
    },
    {
      "imgPath": "assets/images/cat/Spinach.png",
      "catText": "Herbs",
    },
    {
      "imgPath": "assets/images/cat/nuts.png",
      "catText": "Muts",
    },
    {
      "imgPath": "assets/images/cat/spices.png",
      "catText": "Spices",
    },
    {
      "imgPath": "assets/images/cat/grains.png",
      "catText": "Grains",
    },
  ];
  List<Color> gridColors = [
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.amber,
    Colors.greenAccent,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: "Category".toUpperCase(),
            color: color,
            textSize: 22,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            children: List.generate(6, (index) {
              return CategoriesWiget(
                catText: catInfo[index]["catText"],
                imgPath: catInfo[index]["imgPath"],
                passedcolor: gridColors[index],
              );
            }),
          ),
        ));
  }
}
