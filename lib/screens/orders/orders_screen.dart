import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/screens/orders/orders_widget.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/empty_screen.dart';

import '../../widgets/back_widget.dart';
import '../../widgets/text_widgets.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = "/OrderScreen";
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    bool _isEmpty = true;
    return _isEmpty == true
        ? EmptyScreen(
            imagePath: "assets/images/cart.png",
            title: "You didn't place any order yet",
            subtitle: "order something and make ame happy:",
            buttonText: "Shop now")
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: BackWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TextWidget(
                text: "Your Orders (3)",
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        title: "Clear Wishlist!",
                        subtitle: "Your Wishlist will be cleared",
                        fctn: () {},
                        context: context);
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: color,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: ListView.separated(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OrderWidget(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: color,
                  );
                },
                itemCount: 10),
          );
  }
}
