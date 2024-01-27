import 'package:flutter/material.dart';

import '../../constant/global_variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Adding a delay before navigating to the next page

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, 'onBoarding');
    });

    return Scaffold(
      body: Container(
          height: GlobalVariables.sizeHeight(context),
          width: GlobalVariables.sizeWidth(context),
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.background),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 400,
              height: 400,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
              ),
              child: Image.asset(
                GlobalVariables.logo,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )),
    );
  }
}
