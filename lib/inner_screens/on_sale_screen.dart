import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/models/products_model.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/back_widget.dart';
import 'package:fshop2/widgets/empty_products_widget.dart';
import 'package:fshop2/widgets/feed_items.dart';
import 'package:fshop2/widgets/on_sale_widget.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = Utils(context).color;
    final ProductProviders = Provider.of<ProductProvider>(context);
    List<ProductModel> productOnSale = ProductProviders.getOnsaleProducts;
    return Scaffold(
      appBar: AppBar(
        leading: BackWidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Products on Sale",
          color: color,
          textSize: 22,
          isTitle: true,
        ),
      ),
      body: productOnSale.isEmpty
          ? EmptyProductWidget(
              text: "No Products on sale yet!, \nStay tuned",
            )
          : GridView.count(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(productOnSale.length, (index) {
                return ChangeNotifierProvider.value(
                  value: productOnSale[index],
                  child: OnSaleWidget(),
                );
              }),
            ),
    );
  }
}
