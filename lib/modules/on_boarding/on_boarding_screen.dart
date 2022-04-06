import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/layout/home/home_layout_screen.dart';
import 'package:store/modules/on_boarding/on_boarding_item.dart';
import 'package:store/shared/network/locale/shared_preferences_helper.dart';
import 'package:store/shared/styles/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'onBoardingRoute';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentBoardingPageIndex = 0;
  var pageController = PageController();

  List<Widget> boardings = [
    OnBoardingItem(
      imagePath: 'assets/images/onboarding_1.png',
      title: 'Order For Items',
      description: 'Free cashback when you order from the websites you love through Lucky"s website. Shop from Lucky.com to get up to 50% cashback from online shops',
    ),
    OnBoardingItem(
      imagePath: 'assets/images/onboarding_2.png',
      title: 'Payment Proccess',
      description: 'Free cashback when you order from the websites you love through Lucky"s website. Shop from Lucky.com to get up to 50% cashback from online shops',
    ),
    OnBoardingItem(
      imagePath: 'assets/images/onboarding_3.png',
      title: 'Items Delivery',
      description: 'Free cashback when you order from the websites you love through Lucky"s website. Shop from Lucky.com to get up to 50% cashback from online shops',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.00,
        centerTitle: true,
        title: const Text(
          'Online Store',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
        actions: [
          TextButton(
            onPressed: pushToHomeAndSetSharedPreferences,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: appColors.primaryColor,
                fontSize: 18.0,
                fontFamily: 'Roboto',
              )
            )
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                children: boardings,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentBoardingPageIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boardings.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 12,
                    dotHeight: 8,
                    dotColor: Colors.grey,
                    activeDotColor: appColors.primaryColor,
                    radius: 8,
                    expansionFactor: 3.0
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: appColors.primaryColor,
                  onPressed: () {
                    setState(() {
                      if (currentBoardingPageIndex == boardings.length - 1) {
                        pushToHomeAndSetSharedPreferences();
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    });
                  },
                  child: const Icon(Icons.navigate_next),
                )
              ],
            ),
          ],
        ),
      )
    );
  }

  void pushToHomeAndSetSharedPreferences() async {
    await SharedPreferencesHelper.setDate('isNotInOnBoarding', true);
    Navigator.pushReplacementNamed(
      context,
      HomeLayoutScreen.routeName
    );
  }
}
