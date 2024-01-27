import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sole_seekers/constant/font_styles.dart';
import 'package:sole_seekers/constant/global_variables.dart';
import 'package:sole_seekers/screens/auth_screens/widgets/auth_button.dart';
import 'package:sole_seekers/screens/auth_screens/widgets/auth_textfield..dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

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
                Center(
                  child: Image.asset(
                    GlobalVariables.logo,
                    width: 213.w,
                    height: 171.h,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Welcome SoleSeeker!',
                  style: WriteStyles.headerMedium(context),
                  textAlign: TextAlign.start,
                ),
                GlobalVariables.spaceSmaller(),
                Text(
                  'Kindly Signup to access the app',
                  style: WriteStyles.bodyMedium(context),
                  textAlign: TextAlign.start,
                ),
                GlobalVariables.spaceMedium(),
                AuthTextField(
                    hintText: 'Full name', controller: fullNameController),
                GlobalVariables.spaceSmaller(),
                AuthTextField(
                    obscureText: false,
                    hintText: 'Email address',
                    controller: emailController),
                GlobalVariables.spaceSmaller(),
                AuthTextField(
                    obscureText: true,
                    hintText: 'Password',
                    controller: passwordController),
                GlobalVariables.spaceSmaller(),
                AuthTextField(
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController),
                GlobalVariables.spaceMedium(),
                AuthButton(text: 'Sign Up'),
                GlobalVariables.spaceMedium(),
                Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text:
                            'By pressing \“Sign Up\”, you accept the \nconditions of  ',
                        style: WriteStyles.bodySmall(context)),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: WriteStyles.bodySmall(context).copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ])),
                ),
                GlobalVariables.spaceMedium(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
