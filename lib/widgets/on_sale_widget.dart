import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/inner_screens/product_details.dart';
import 'package:fshop2/models/products_model.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/heart_btn.dart';
import 'package:fshop2/widgets/price_widget.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    final productModel = Provider.of<ProductModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productModel.id);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl: productModel.imgUrl,
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: productModel.isPiece ? "piece" : "1KG",
                          color: color,
                          isTitle: true,
                          textSize: 22,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("Press Cart Button");
                              },
                              child: Icon(
                                IconlyLight.bag2,
                                size: 25,
                                color: color,
                              ),
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            HeartBTN(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                PriceWidget(
                  salePrice: productModel.salePrice,
                  price: productModel.price,
                  textPrice: "1",
                  isOnSale: true,
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextWidget(
                  text: productModel.title,
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
