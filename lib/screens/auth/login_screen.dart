import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fshop2/screens/auth/forget_password.dart';
import 'package:fshop2/screens/auth/register_screen.dart';
import 'package:fshop2/screens/btm_bar_screen.dart';
import 'package:fshop2/services/global_method.dart';
import 'package:fshop2/widgets/auth_button.dart';
import 'package:fshop2/widgets/google_button.dart';
import 'package:fshop2/widgets/text_widgets.dart';

import '../../consts/const.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordFocusNode.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print("The form is valid");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    text: "Sign in to Continue",
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
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            _submitFormOnLogin();
                          },
                          controller: _passwordTextController,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return "Pleas Enter a valid Password";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.white),
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
                    fctn: _submitFormOnLogin,
                    buttonText: "Login",
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  GoogleBUtton(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      TextWidget(text: "OR", color: Colors.white, textSize: 18),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  AuthButton(
                    fctn: () {},
                    buttonText: "Continue as a guest",
                    //primary: Color.fromARGB(115, 246, 145, 145),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don't  Have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        children: [
                          TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  GlobalMethods.NavigateTo(
                                      ctx: context,
                                      routeName: RegisterScreen.routeName);
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
