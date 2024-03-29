import 'package:flutter/material.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sole_seekers/constant/font_styles.dart';
import 'package:sole_seekers/constant/global_variables.dart';
import 'package:sole_seekers/core/providers/services_provider.dart';
import 'package:sole_seekers/constant/widgets/custom_button.dart';
import 'package:sole_seekers/constant/widgets/custom_textfield.dart';
import 'package:sole_seekers/screens/auth_screens/widgets/privacy_policy_dialog.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    var servicesProvider =
        Provider.of<ServicesProvider>(context, listen: false);

    Future<void> loginLogic() async {
      // Call signIn function from ServicesProvider
      servicesProvider.signIn(
          emailController.text, passwordController.text, context);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: GlobalVariables.normPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FOR CHANGING THEME

                SizedBox(height: 25.h),
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
                  'Kindly Login to access the app',
                  style: WriteStyles.bodyMedium(context),
                  textAlign: TextAlign.start,
                ),
                GlobalVariables.spaceMedium(),
                CustomTextField(
                    obscureText: false,
                    hintText: 'Email address',
                    controller: emailController),
                GlobalVariables.spaceMedium(),
                CustomTextField(
                    obscureText: true,
                    hintText: 'Password',
                    controller: passwordController),
                GlobalVariables.spaceMedium(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'forgotPassword');
                      },
                      child: Text(
                        'Forgot Password',
                        textAlign: TextAlign.end,
                        style: WriteStyles.hintText(context),
                      ),
                    ),
                  ],
                ),
                GlobalVariables.spaceMedium(),
                CustomButton(
                  text: 'Sign In',
                  isLoading:
                      Provider.of<ServicesProvider>(context, listen: true)
                          .loader,
                  onTap: loginLogic,
                ),
                GlobalVariables.spaceMedium(),
                GestureDetector(
                  onTap: () => privacyPolicy(context),
                  child: Center(
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
                ),
                GlobalVariables.spaceMedium(),
                // TODO set up google authentication and change icon.
                Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CarbonIcons.logo_google,
                          size: 30.sp,
                        ))),
                GlobalVariables.spaceMedium(),
                Center(
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
