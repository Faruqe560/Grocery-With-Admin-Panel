import 'package:flutter/material.dart';

import 'package:fshop2/inner_screens/feed_screen.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class EmptyScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  //final Function btnfuntion;

  const EmptyScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    //required this.btnfuntion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextWidget(
                text: "Whoops!",
                color: Colors.amberAccent,
                textSize: 30,
                isTitle: true,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextWidget(
                text: title,
                color: color,
                textSize: 20,
              ),
              TextWidget(
                text: subtitle,
                color: color,
                textSize: 20,
              ),
              SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: color,
                        ),
                      ),
                      primary: Theme.of(context).colorScheme.secondary,
                      onPrimary: color,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                  onPressed: () {
                    GlobalMethods.NavigateTo(
                        ctx: context, routeName: FeedsScreen.routeName);
                  },
                  child: Text(buttonText))
            ],
          ),
        )),
      ),
    );
  }
}
