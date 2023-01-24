import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/models/products_model.dart';
import 'package:fshop2/providers/products_provider.dart';
import 'package:fshop2/widgets/back_widget.dart';
import 'package:fshop2/widgets/empty_products_widget.dart';
import 'package:fshop2/widgets/feed_items.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

import '../services/utils.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = "/CategoryScreen";

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFoucusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchTextController.dispose();
    _searchTextFoucusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = Utils(context).color;
    final ProductProviders = Provider.of<ProductProvider>(context);
    final catName = ModalRoute.of(context)!.settings.arguments as String;
    List<ProductModel> productBYCat = ProductProviders.findByCategory(catName);
    return Scaffold(
        appBar: AppBar(
          leading: BackWidget(),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: "All Products",
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          centerTitle: true,
        ),
        body: productBYCat.isEmpty
            ? EmptyProductWidget(
                text: "No  Products belong to this Category",
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: TextField(
                          focusNode: _searchTextFoucusNode,
                          controller: _searchTextController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 1,
                                ),
                              ),
                              hintText: "What's in Your Mind",
                              prefixIcon: Icon(IconlyLight.search),
                              suffix: IconButton(
                                  onPressed: () {
                                    _searchTextController.clear();
                                    _searchTextFoucusNode.unfocus();
                                  },
                                  icon: Icon(
                                    IconlyLight.closeSquare,
                                    color: _searchTextFoucusNode.hasFocus
                                        ? Colors.red
                                        : color,
                                  ))),
                        ),
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      padding: EdgeInsets.zero,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: size.width / (size.height * 0.57),
                      children: List.generate(productBYCat.length, (index) {
                        return ChangeNotifierProvider.value(
                          value: productBYCat[index],
                          child: FeedWidget(),
                        );
                      }),
                    ),
                  ],
                ),
              ));
  }
}
