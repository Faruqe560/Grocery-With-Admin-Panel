import 'package:flutter/material.dart';
import 'package:fshop2/consts/theme_data.dart';
import 'package:fshop2/inner_screens/cat_screen.dart';
import 'package:fshop2/inner_screens/feed_screen.dart';
import 'package:fshop2/inner_screens/on_sale_screen.dart';
import 'package:fshop2/inner_screens/product_details.dart';
import 'package:fshop2/provider/dark_theme_provider.dart';
import 'package:fshop2/providers/products_provider.dart';
import 'package:fshop2/screens/auth/forget_password.dart';
import 'package:fshop2/screens/auth/login_screen.dart';
import 'package:fshop2/screens/auth/register_screen.dart';
import 'package:fshop2/screens/btm_bar_screen.dart';
import 'package:fshop2/screens/categories_screen.dart';
import 'package:fshop2/screens/home_screen.dart';
import 'package:fshop2/screens/orders/orders_screen.dart';
import 'package:fshop2/screens/viewed_recently/viewed_screen.dart';
import 'package:fshop2/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDartTheme =
        await themeChangeProvider.darkThemePrefs.getDarkTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(
            create: (_) => ProductProvider(),
          ),
        ],
        child: Consumer<DarkThemeProvider>(
            builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fshop2',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: BottomBarScreen(),
            routes: {
              OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
              FeedsScreen.routeName: (ctx) => const FeedsScreen(),
              ProductDetails.routeName: (ctx) => const ProductDetails(),
              WishlistScreen.routeName: (ctx) => const WishlistScreen(),
              OrderScreen.routeName: (ctx) => const OrderScreen(),
              ViwedRecently.routeName: (ctx) => const ViwedRecently(),
              RegisterScreen.routeName: (ctx) => const RegisterScreen(),
              LoginScreen.routeName: (ctx) => const LoginScreen(),
              ForgetPassored.routeName: (ctx) => const ForgetPassored(),
              CategoryScreen.routeName: (ctx) => CategoryScreen(),
            },
          );
        }));
  }
}
