import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fshop2/inner_screens/product_details.dart';
import 'package:fshop2/models/products_model.dart';
import 'package:fshop2/models/products_model.dart';
import 'package:fshop2/providers/products_provider.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/heart_btn.dart';
import 'package:fshop2/widgets/price_widget.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final TextEditingController _quantittyTextController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _quantittyTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantittyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    final productModel = Provider.of<ProductModel>(context);
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor.withOpacity(0.9),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName,
              arguments: productModel.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: productModel.imgUrl,
              height: size.width * 0.21,
              width: size.width * 0.2,
              boxFit: BoxFit.fill,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: TextWidget(
                      text: productModel.title,
                      color: color,
                      textSize: 20,
                      isTitle: true,
                      maxLines: 1,
                    ),
                  ),
                  Flexible(flex: 1, child: HeartBTN()),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: PriceWidget(
                      salePrice: productModel.salePrice,
                      price: productModel.price,
                      textPrice: _quantittyTextController.text,
                      isOnSale: productModel.isOnSale,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 6,
                          child: FittedBox(
                            child: TextWidget(
                              text: productModel.isPiece ? "piece" : "KG",
                              color: color,
                              textSize: 20,
                              isTitle: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          flex: 2,
                          child: TextFormField(
                            controller: _quantittyTextController,
                            key: ValueKey("10"),
                            style: TextStyle(color: color, fontSize: 18),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            enabled: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp("[0-9]"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: "Add to cart",
                  color: color,
                  textSize: 20,
                  isTitle: true,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                      ),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
