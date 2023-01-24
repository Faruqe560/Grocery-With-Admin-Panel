import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fshop2/consts/const.dart';
import 'package:fshop2/screens/auth/forget_password.dart';
import 'package:fshop2/screens/auth/login_screen.dart';
import 'package:fshop2/screens/btm_bar_screen.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/auth_button.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/RegisterScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fulNameTextController = TextEditingController();
  final _shippingAddressController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _fulNameTextController.dispose();
    _shippingAddressController.dispose();
    _passwordFocusNode.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();

    super.dispose();
  }

  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = Utils(context).color;
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            duration: 700,
            autoplayDelay: 7000,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 30.0,
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
                    text: "Welcome Back",
                    color: Colors.white,
                    textSize: 30,
                    isTitle: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextWidget(
                    text: "Sign up to Continue",
                    color: Colors.white,
                    textSize: 20,
                    isTitle: true,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          controller: _fulNameTextController,
                          //keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This Field is Missing";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Full Name",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        TextFormField(
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
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
                              hintText: "Email",
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
                        TextFormField(
                          focusNode: _passwordFocusNode,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordTextController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return "Pleas Enter a valid Password";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_addressFocusNode),
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "Passowrd",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        TextFormField(
                          focusNode: _addressFocusNode,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: _submitFormOnRegister,
                          controller: _shippingAddressController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return "Pleas Enter a valid email address";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Shipping Address",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        GlobalMethods.NavigateTo(
                            ctx: context, routeName: ForgetPassored.routeName);
                      },
                      child: Text(
                        "Forget Password?",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AuthButton(
                    fctn: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomBarScreen()));
                    },
                    buttonText: "Sign Up",
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Already a user?",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        children: [
                          TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, LoginScreen.routeName);
                                })
                        ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
