import 'package:flutter/material.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class GoogleBUtton extends StatelessWidget {
  const GoogleBUtton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Image.asset(
                "assets/images/google.png",
                width: 40.0,
              ),
            ),
            TextWidget(
              text: "  sign in with google",
              color: Colors.white,
              textSize: 18,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
