import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sole_seekers/constant/font_styles.dart';
import 'package:sole_seekers/constant/global_variables.dart';
import 'package:sole_seekers/screens/misc_screens/widgets/onBoard1.dart';
import 'package:sole_seekers/screens/misc_screens/widgets/onBoard2.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: GlobalVariables.normPadding,
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  onLastPage = (value == 1);
                });
              },
              children: [OnBoard1(), OnBoard2()],
            ),
            Align(
                alignment: Alignment(0, 0.87),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          _controller.jumpToPage(1);
                        },
                        child: Text(
                          'Skip',
                          style: WriteStyles.headerSmall(context)
                              .copyWith(fontSize: 20),
                        )),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                    ),
                    onLastPage
                        ? TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'login');
                            },
                            child: Text(
                              'Done',
                              style: WriteStyles.headerSmall(context)
                                  .copyWith(fontSize: 20),
                            ))
                        : TextButton(
                            onPressed: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeOut);
                            },
                            child: Text(
                              'Next',
                              style: WriteStyles.headerSmall(context)
                                  .copyWith(fontSize: 20),
                            )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
