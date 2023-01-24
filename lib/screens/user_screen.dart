import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/provider/dark_theme_provider.dart';
import 'package:fshop2/screens/orders/orders_screen.dart';
import 'package:fshop2/screens/viewed_recently/viewed_screen.dart';
import 'package:fshop2/screens/wishlist/wishlist_screen.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    // TODO: implement dispose
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: "Hi, ",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: "Md.Faruqe Hasan",
                      style: TextStyle(
                          color: color,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("My Name Is Faruqe Hasan");
                        })
                ])),
            TextWidget(
                text: "faruqehassan7@gmail.com", color: color, textSize: 16),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 2,
              color: color,
            ),
            SizedBox(
              height: 20.0,
            ),
            _listTiles(
              title: "address",
              subtitle: "121/5,New Eskaton,Dhaka1217.",
              icon: IconlyLight.profile,
              onPressed: () async {
                await _showAddressDialog();
              },
              color: color,
            ),
            _listTiles(
              title: "Orders",
              icon: IconlyLight.bag,
              onPressed: () {
                GlobalMethods.NavigateTo(
                    ctx: context, routeName: OrderScreen.routeName);
              },
              color: color,
            ),
            _listTiles(
              title: "Wishlist",
              icon: IconlyLight.heart,
              onPressed: () {
                GlobalMethods.NavigateTo(
                    ctx: context, routeName: WishlistScreen.routeName);
              },
              color: color,
            ),
            _listTiles(
              title: "Viewed",
              icon: IconlyLight.show,
              onPressed: () {
                GlobalMethods.NavigateTo(
                    ctx: context, routeName: ViwedRecently.routeName);
              },
              color: color,
            ),
            _listTiles(
              title: "Forget Password",
              icon: IconlyLight.unlock,
              onPressed: () {},
              color: color,
            ),
            SwitchListTile(
              title: TextWidget(
                text: themeState.getDarkTheme ? "Dark Mode" : "Light Mode",
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDartTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
            _listTiles(
              title: "Logout",
              icon: IconlyLight.logout,
              onPressed: () {
                GlobalMethods.warningDialog(
                    title: "Sign Out!",
                    subtitle: "Do You wanna sign Out",
                    fctn: () {},
                    context: context);
              },
              color: color,
            ),
          ],
        )),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update"),
          content: TextField(
            // onChanged: ((value) {
            //   print(
            //       '_addressTextController.text : ${_addressTextController.text}');
            // }),
            controller: _addressTextController,
            maxLines: 5,
            decoration: InputDecoration(hintText: "Your Address"),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); //for demo
                },
                child: Text("Update")),
          ],
        );
      },
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
