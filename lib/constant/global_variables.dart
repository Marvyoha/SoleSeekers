import 'package:flutter/material.dart';

class GlobalVariables {
  static String appIcon = 'assets/SoleSeekers app icon.jpg';
  static String logoLight = 'assets/SoleSeekers Light.png';
  static String logoDark = 'assets/SoleSeekers Dark.png';
  static String onboardimage1 = 'assets/On boarding pic.png';
  static String onboardimage2 = 'assets/On boarding pic2.png';

  static double sizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double sizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static EdgeInsetsGeometry normPadding = const EdgeInsets.all(20);

  static spaceLarge(BuildContext context, {bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(width: sizeWidth(context) * 0.1);
    }
    return SizedBox(height: sizeHeight(context) * 0.1);
  }

  static spaceMedium(BuildContext context, {bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(width: sizeWidth(context) * 0.05);
    }
    return SizedBox(height: sizeHeight(context) * 0.05);
  }

  static spaceSmall(BuildContext context, {bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(width: sizeWidth(context) * 0.01);
    }
    return SizedBox(height: sizeHeight(context) * 0.01);
  }
}
