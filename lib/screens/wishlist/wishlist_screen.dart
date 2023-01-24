import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/screens/wishlist/wishlist_widget.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/back_widget.dart';
import 'package:fshop2/widgets/empty_screen.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WishlistScreen extends StatefulWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    bool _isEmpty = true;
    return _isEmpty
        ? EmptyScreen(
            imagePath: "assets/images/wishlist.png",
            title: "Your wishlist is Empty",
            subtitle: "Explore more and shortlist som items",
            buttonText: "Add a wish")
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: BackWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TextWidget(
                text: "Wishlist (3)",
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
            body: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemBuilder: (context, index) {
                return WishlistWidget();
              },
            ),
          );
  }
}
