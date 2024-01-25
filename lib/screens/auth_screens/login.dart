import 'package:flutter/material.dart';
import 'package:sole_seekers/constant/font_styles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ROY DO HOME PAGE',
          style: WriteStyles.headerLarge(context),
        ),
      ),
    );
  }
}
