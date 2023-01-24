import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/inner_screens/feed_screen.dart';
import 'package:fshop2/screens/cart/cart_widget.dart';
import 'package:fshop2/widgets/empty_screen.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    bool _isEmpty = true;
    return _isEmpty
        ? EmptyScreen(
            imagePath: "assets/images/cart.png",
            title: "Whoops!",
            subtitle: "No Items in your cart yet",
            buttonText: "Shop Now",
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TextWidget(
                text: "Cart(3)",
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                      title: "Empty your Cart?",
                      subtitle: "Are You Sure",
                      fctn: () {},
                      context: context,
                    );
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: color,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                _checkout(ctx: context),
                Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (ctx, index) {
                        return CartWidget();
                      }),
                ),
              ],
            ));
  }

  Widget _checkout({required BuildContext ctx}) {
    Size size = Utils(ctx).getScreenSize;
    final Color color = Utils(ctx).color;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: "Order Now",
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                ),
              ),
            ),
            Spacer(),
            FittedBox(
              child: TextWidget(
                text: "Total: \$0.59",
                color: color,
                textSize: 18,
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
