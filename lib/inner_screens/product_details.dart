import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/models/products_model.dart';
import 'package:fshop2/providers/cart_provider.dart';
import 'package:fshop2/providers/products_provider.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/heart_btn.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = "/ProductDetails";
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextEditingController _quantittyTextController =
      TextEditingController(text: "1");
  @override
  void dispose() {
    _quantittyTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final getCurrentProduct = productProvider.findProductById(productId);
    double usedPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;
    double totalPrice = usedPrice * int.parse(_quantittyTextController.text);
    bool? _isInCart =
        cartProvider.getCartItems.containsKey(getCurrentProduct.id);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () =>
              Navigator.canPop(context) ? Navigator.pop(context) : null,
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
            size: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: FancyShimmerImage(
              imageUrl: getCurrentProduct.imgUrl,
              boxFit: BoxFit.fill,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 35.0, right: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextWidget(
                            text: getCurrentProduct.title,
                            color: color,
                            textSize: 25,
                            isTitle: true,
                          ),
                        ),
                        HeartBTN()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 35.0, right: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "\$${usedPrice.toStringAsFixed(2)}/",
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        TextWidget(
                          text: getCurrentProduct.isPiece ? "Piece" : "KG ",
                          color: color,
                          textSize: 18,
                          isTitle: true,
                        ),
                        Visibility(
                          visible: getCurrentProduct.isOnSale ? true : false,
                          child: Text(
                            "\$${getCurrentProduct.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 15,
                              color: color,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextWidget(
                            text: "Free Delivery",
                            color: color,
                            textSize: 20,
                            isTitle: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _quantityCountroller(
                        fctn: () {
                          if (_quantittyTextController.text == "1") {
                            return;
                          } else {
                            setState(() {
                              _quantittyTextController.text =
                                  (int.parse(_quantittyTextController.text) - 1)
                                      .toString();
                            });
                          }
                        },
                        qcolor: Colors.red,
                        icon: CupertinoIcons.minus,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _quantittyTextController,
                          key: ValueKey("quantity"),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          onChanged: (v) {
                            setState(() {
                              if (v.isEmpty) {
                                _quantittyTextController.text = "1";
                              } else {
                                return;
                              }
                            });
                          },
                        ),
                      ),
                      _quantityCountroller(
                        fctn: () {
                          setState(() {
                            _quantittyTextController.text =
                                (int.parse(_quantittyTextController.text) + 1)
                                    .toString();
                          });
                        },
                        qcolor: Colors.green,
                        icon: CupertinoIcons.plus,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: size.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Total",
                                color: Colors.redAccent,
                                textSize: 22,
                                isTitle: true,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    TextWidget(
                                      text:
                                          "\$${totalPrice.toStringAsFixed(2)}/",
                                      color: color,
                                      textSize: 20,
                                      isTitle: true,
                                    ),
                                    TextWidget(
                                      text:
                                          "${_quantittyTextController.text}kg",
                                      color: color,
                                      textSize: 22,
                                      isTitle: false,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Flexible(
                            child: Material(
                          color: _isInCart
                              ? Color.fromARGB(255, 239, 14, 220)
                              : Colors.green,
                          borderRadius: BorderRadius.circular(12.0),
                          child: InkWell(
                            onTap: () {
                              _isInCart
                                  ? null
                                  : cartProvider.addProductsToCart(
                                      productId: getCurrentProduct.id,
                                      quantity: int.parse(
                                          _quantittyTextController.text));
                            },
                            borderRadius: BorderRadius.circular(12.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextWidget(
                                text: _isInCart ? "In cart" : "Add to cart",
                                color: color,
                                textSize: 18,
                                isTitle: true,
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityCountroller(
      {required Function fctn, required IconData icon, required Color qcolor}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Material(
          color: qcolor,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            onTap: () {
              fctn();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
