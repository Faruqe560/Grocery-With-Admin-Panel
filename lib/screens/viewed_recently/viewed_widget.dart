import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/inner_screens/product_details.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class ViewedWidget extends StatefulWidget {
  const ViewedWidget({super.key});

  @override
  State<ViewedWidget> createState() => _ViewedWidgetState();
}

class _ViewedWidgetState extends State<ViewedWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {
        GlobalMethods.NavigateTo(
          ctx: context,
          routeName: ProductDetails.routeName,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FancyShimmerImage(
            height: size.width * 0.27,
            width: size.width * 0.25,
            imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
            boxFit: BoxFit.fill,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            children: [
              TextWidget(
                text: "Title",
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              SizedBox(
                height: 12.0,
              ),
              TextWidget(
                text: "\$12.22",
                color: color,
                textSize: 20,
                isTitle: true,
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.green,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.add,
                    color: color,
                    size: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
