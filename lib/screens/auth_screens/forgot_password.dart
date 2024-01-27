import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sole_seekers/constant/font_styles.dart';
import 'package:sole_seekers/constant/global_variables.dart';
import 'package:sole_seekers/screens/auth_screens/widgets/auth_button.dart';
import 'package:sole_seekers/screens/auth_screens/widgets/auth_textfield..dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 35.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: GlobalVariables.normPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalVariables.spaceSmall(),
                Center(
                  child: Image.asset(
                    GlobalVariables.logo,
                    width: 213.w,
                    height: 171.h,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Welcome SoleSeeker?',
                  style: WriteStyles.headerMedium(context),
                  textAlign: TextAlign.start,
                ),
                GlobalVariables.spaceSmaller(),
                Text(
                  'Kindly enter your email to send a verification link.',
                  style: WriteStyles.bodyMedium(context),
                  textAlign: TextAlign.start,
                ),
                GlobalVariables.spaceMedium(),
                AuthTextField(
                    obscureText: false,
                    hintText: 'Email address',
                    controller: emailController),
                SizedBox(height: 65.h),
                AuthButton(text: 'Reset Password'),
                GlobalVariables.spaceMedium(),
                Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text:
                            'By pressing \“Sign In\”, you accept the \nconditions of  ',
                        style: WriteStyles.bodySmall(context)),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: WriteStyles.bodySmall(context).copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ])),
                ),
                SizedBox(height: 101.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'signup');
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Don\'t have an account? ',
                          style: WriteStyles.bodySmall(context)),
                      TextSpan(
                        text: 'Sign Up',
                        style: WriteStyles.bodySmall(context).copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ])),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
