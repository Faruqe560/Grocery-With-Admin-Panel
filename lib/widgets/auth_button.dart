import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Function fctn;
  final String buttonText;
  final Color primary;

  const AuthButton({
    Key? key,
    required this.fctn,
    required this.buttonText,
    this.primary = Colors.white38,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: primary),
        onPressed: () {
          fctn();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
