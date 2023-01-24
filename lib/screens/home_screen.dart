import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/consts/const.dart';
import 'package:fshop2/inner_screens/feed_screen.dart';
import 'package:fshop2/inner_screens/on_sale_screen.dart';
import 'package:fshop2/models/products_model.dart';
import 'package:fshop2/providers/products_provider.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/feed_items.dart';
import 'package:fshop2/widgets/on_sale_widget.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final Color color = Utils(context).color;
    GlobalMethods globalMethods = GlobalMethods();
    final ProductProviders = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = ProductProviders.getProducts;
    List<ProductModel> productsOnSale = ProductProviders.getOnsaleProducts;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Constss.offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: Constss.offerImages.length,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
                control: SwiperControl(color: Colors.amberAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.NavigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: "View All",
                color: Colors.blue,
                textSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      children: [
                        TextWidget(
                          text: "On Sale".toUpperCase(),
                          color: Colors.red,
                          textSize: 22,
                          isTitle: true,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          IconlyLight.discount,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: size.height * 0.25,
                      child: ListView.builder(
                          itemCount: productsOnSale.length < 10
                              ? productsOnSale.length
                              : 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ChangeNotifierProvider.value(
                              value: productsOnSale[index],
                              child: OnSaleWidget(),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Our Products",
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  // Spacer(),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.NavigateTo(
                          ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: "Browse All",
                      color: Colors.blue,
                      textSize: 22,
                    ),
                  ),
                ],
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
              children: List.generate(
                  allProducts.length < 4 ? allProducts.length : 4, (index) {
                return ChangeNotifierProvider.value(
                  value: allProducts[index],
                  child: FeedWidget(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
