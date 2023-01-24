import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/inner_screens/product_details.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/heart_btn.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.NavigateTo(
              ctx: context, routeName: ProductDetails.routeName);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: color, width: 0.5),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.0),
                width: size.width * 0.2,
                height: size.width * 0.25,
                child: FancyShimmerImage(
                  imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag2,
                            color: color,
                          ),
                        ),
                        HeartBTN(),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextWidget(
                      text: "Title",
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextWidget(
                    text: "\$3.54",
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
