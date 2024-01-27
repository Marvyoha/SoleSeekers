import 'package:flutter/material.dart';

import '../../../constant/font_styles.dart';

class AuthTextField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final TextEditingController? controller;

  const AuthTextField(
      {super.key,
      this.obscureText = false,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: WriteStyles.hintText(context),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary)),
        focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            // borderSide: BorderSide(
            //     color: Theme.of(context).colorScheme.background, width: 1.3),
            ),
      ),
    );
  }
}
