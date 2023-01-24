import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class GlobalMethods {
  static NavigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fctn,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/warning-sign.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(title)
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  text: "Cancel",
                  color: Colors.cyan,
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  fctn();
                },
                child: TextWidget(
                  text: "Ok",
                  color: Colors.red,
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }
}
