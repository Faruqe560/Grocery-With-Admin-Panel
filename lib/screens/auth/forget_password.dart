import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/consts/const.dart';
import 'package:fshop2/screens/btm_bar_screen.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/auth_button.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class ForgetPassored extends StatefulWidget {
  static const routeName = "/ForgetPassored";
  const ForgetPassored({super.key});

  @override
  State<ForgetPassored> createState() => _ForgetPassoredState();
}

class _ForgetPassoredState extends State<ForgetPassored> {
  final _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    super.dispose();
  }

  void _forgetPassowrdFCT() async {}

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        body: Stack(children: [
      Swiper(
        duration: 500,
        autoplayDelay: 5000,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            Constss.authImagesPaths[index],
            fit: BoxFit.cover,
          );
        },
        autoplay: true,
        itemCount: Constss.authImagesPaths.length,
      ),
      Container(
        color: Colors.black.withOpacity(0.7),
      ),
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                  }),
                  child: Icon(
                    IconlyLight.arrowLeft2,
                    color: theme == true ? Colors.black : Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                TextWidget(
                  text: "Forget Password",
                  color: Colors.white,
                  textSize: 30,
                  isTitle: true,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Pleas Enter a valid email address";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    AuthButton(
                      fctn: () {
                        _forgetPassowrdFCT();
                      },
                      buttonText: "Reset Now",
                    ),
                  ],
                ),
              ]))
    ]));
  }
}
