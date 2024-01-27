import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sole_seekers/constant/font_styles.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const AuthButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          elevation: 4,
          shadowColor: Theme.of(context).colorScheme.primary,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            height: 49.h,
            width: 301.w,
            child: Center(
              child: Text(
                text,
                style: WriteStyles.bodyMedium(context)
                    .copyWith(color: Theme.of(context).colorScheme.background),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
