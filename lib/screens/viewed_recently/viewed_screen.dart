import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/screens/viewed_recently/viewed_widget.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/back_widget.dart';
import 'package:fshop2/widgets/empty_screen.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class ViwedRecently extends StatefulWidget {
  static const routeName = "/ViwedRecently";
  const ViwedRecently({super.key});

  @override
  State<ViwedRecently> createState() => _ViwedRecentlyState();
}

class _ViwedRecentlyState extends State<ViwedRecently> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    bool _isEmpty = true;
    if (_isEmpty = true) {
      return EmptyScreen(
        imagePath: "assets/images/history.png",
        title: "Your history is Empty",
        subtitle: "No Products has been viewed yet!",
        buttonText: "Shop Now",
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: BackWidget(),
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: TextWidget(
              text: "History",
              color: color,
              textSize: 22,
              isTitle: true,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  GlobalMethods.warningDialog(
                      title: "Clear History!",
                      subtitle: "Your History  will be cleared",
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
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ViewedWidget(),
                );
              }));
    }
  }
}
