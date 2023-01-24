import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fshop2/inner_screens/product_details.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/heart_btn.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final TextEditingController _quantitcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _quantitcontroller.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _quantitcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {
        GlobalMethods.NavigateTo(
            ctx: context, routeName: ProductDetails.routeName);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.27,
                      width: size.width * 0.27,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: FancyShimmerImage(
                        imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Title",
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              _quantityCountroller(
                                fctn: () {
                                  if (_quantitcontroller.text == "1") {
                                    return;
                                  } else {
                                    setState(() {
                                      _quantitcontroller.text =
                                          (int.parse(_quantitcontroller.text) -
                                                  1)
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
                                  controller: _quantitcontroller,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    ),
                                  ],
                                  onChanged: (v) {
                                    setState(() {
                                      if (v.isEmpty) {
                                        _quantitcontroller.text = "1";
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
                                    _quantitcontroller.text =
                                        (int.parse(_quantitcontroller.text) + 1)
                                            .toString();
                                  });
                                },
                                qcolor: Colors.green,
                                icon: CupertinoIcons.plus,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          HeartBTN(),
                          TextWidget(
                            text: "\$0.28",
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                            isTitle: true,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
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
