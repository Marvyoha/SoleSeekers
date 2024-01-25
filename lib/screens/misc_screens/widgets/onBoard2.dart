import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_seekers/constant/font_styles.dart';
import 'package:sole_seekers/constant/global_variables.dart';
import 'package:sole_seekers/core/providers/theme_provider.dart';

class OnBoard2 extends StatelessWidget {
  const OnBoard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: GlobalVariables.normPadding,
      child: Column(
        children: [
          Container(
            height: 200,
            width: 240,
            child: Image.asset(Provider.of<ThemeProvider>(context).isLight
                ? GlobalVariables.logoLight
                : GlobalVariables.logoDark),
          ),
          Text(
            'We carry all topbrands and latest styles to fit unique tastes',
            textAlign: TextAlign.start,
            style: WriteStyles.headerLarge(context).copyWith(fontSize: 29),
          ),
          Container(
              height: 320,
              width: 320,
              child: Image.asset(GlobalVariables.onboardimage1)),
        ],
      ),
    );
  }
}
