import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sole_seekers/constant/font_styles.dart';
import 'package:sole_seekers/constant/global_variables.dart';
import 'package:sole_seekers/screens/misc_screens/widgets/onBoard.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: GlobalVariables.onBoardPadding,
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    onLastPage = (value == 2);
                  });
                },
                children: [
                  OnBoard(
                      image: GlobalVariables.onboardimage1,
                      phrase:
                          'Welcome to SoleSeekers! \nWhere shoes meet purpose.'),
                  OnBoard(
                      image: GlobalVariables.onboardimage2,
                      phrase:
                          'We carry all top brands and latest styles to fit your unique tastes.'),
                  OnBoard(
                      image: GlobalVariables.onboardimage3,
                      phrase:
                          'Let your feet guide you. Try on a new perspective with our shoes.')
                ],
              ),
              Align(
                  alignment: Alignment(0, 0.87),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      onLastPage
                          ? SizedBox(
                              width: 35.w,
                            )
                          : TextButton(
                              onPressed: () {
                                _controller.jumpToPage(2);
                              },
                              child: Text(
                                'Skip',
                                style: WriteStyles.headerSmall(context)
                                    .copyWith(fontSize: 20.sp),
                              )),
                      SmoothPageIndicator(
                        effect: ExpandingDotsEffect(
                            activeDotColor:
                                Theme.of(context).colorScheme.primary,
                            dotColor: Theme.of(context).colorScheme.secondary),
                        controller: _controller,
                        count: 3,
                      ),
                      onLastPage
                          ? TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'login');
                              },
                              child: Text(
                                'Done',
                                style: WriteStyles.headerSmall(context)
                                    .copyWith(fontSize: 20.sp),
                              ))
                          : TextButton(
                              onPressed: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeOut);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Next',
                                    style: WriteStyles.headerSmall(context)
                                        .copyWith(fontSize: 20.sp),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 28,
                                  )
                                ],
                              )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
