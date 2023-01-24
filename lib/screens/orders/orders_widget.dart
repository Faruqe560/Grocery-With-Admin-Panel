import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fshop2/inner_screens/product_details.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/widgets/text_widgets.dart';

import '../../services/utils.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return ListTile(
      subtitle: Text("paid: \$2.45"),
      onTap: () {
        GlobalMethods.NavigateTo(
          ctx: context,
          routeName: ProductDetails.routeName,
        );
      },
      leading: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: FancyShimmerImage(
          width: size.width * 0.2,
          imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
          boxFit: BoxFit.fill,
        ),
      ),
      title: TextWidget(
        text: "Title x13",
        color: color,
        textSize: 18,
        isTitle: true,
      ),
      trailing: TextWidget(
        text: "12/12/2022",
        color: color,
        textSize: 18,
        isTitle: true,
      ),
    );
  }
}
