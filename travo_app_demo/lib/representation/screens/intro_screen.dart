import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travo_app_demo/core/constants/color_constants.dart';
import 'package:travo_app_demo/core/constants/dismension_constants.dart';
import 'package:travo_app_demo/core/constants/textstyle_constants.dart';
import 'package:travo_app_demo/core/helpers/asset_helper.dart';
import 'package:travo_app_demo/core/helpers/image_helper.dart';
import 'package:travo_app_demo/representation/screens/home_screen.dart';
import 'package:travo_app_demo/representation/widgets/button_primary_widgets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static const routerName = "intro_screen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final StreamController<double> _pageStreamController =
      StreamController<double>.broadcast();
  final PageController _pageController = PageController();
  late int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toDouble());
    });
  }

  Widget _buildItemIntroScreen(
    String image,
    String title,
    String description,
    Alignment alignment,
  ) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: alignment,
              child: ImageHepler.loadFromAsset(image,
                  height: 400, fit: BoxFit.fitHeight)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: paddingDefault,
                  right: paddingDefault,
                  top: paddingDefault * 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: distanceDefault),
                      child: Text(
                        title,
                        style: AppStyle.largeText,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: distanceDefault * 2),
                      child: Text(description),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                  AssetHelper.imageIntro1,
                  "Book a flight",
                  '''Found a flight that matches your destination 
and schedule? Book it instantly.''',
                  Alignment.centerRight),
              _buildItemIntroScreen(
                  AssetHelper.imageIntro2,
                  "Find a hotel room",
                  '''Select the day, book your room. We give you 
the best price.''',
                  Alignment.center),
              _buildItemIntroScreen(
                  AssetHelper.imageIntro3,
                  "Enjoy your trip",
                  '''Easy discovering new places and share these 
between your friends and travel together.''',
                  Alignment.centerLeft)
            ],
          ),
          Positioned(
              bottom: screenHeight / 13,
              left: paddingDefault,
              right: paddingDefault,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotColor: ColorPalette.lightGray,
                        dotWidth: distanceDefault,
                        dotHeight: distanceDefault,
                        activeDotColor: ColorPalette.yellowColor),
                  ),
                  StreamBuilder<double>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      String titleGetStated = "Get Started";
                      var newTitle = titleGetStated.substring(0, counter);
                      if (snapshot.data! > 1.5) {
                        if (counter > titleGetStated.length - 1) {
                          counter = titleGetStated.length;
                        } else {
                          counter++;
                        }
                      } else {
                        counter = 0;
                      }
                      if (snapshot.data! == 2 &&
                          newTitle.length != titleGetStated.length) {
                        newTitle = titleGetStated;
                        counter = titleGetStated.length;
                      }
                      return ButtonPrimaryWidget(
                        title: snapshot.data! > 1.5 ? newTitle : "Next",
                        ontap: () {
                          if (snapshot.data! <= 1.5) {
                            return _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.linear);
                          } else {
                            Navigator.pushNamed(context, HomeScreen.routerName);
                          }
                        },
                      );
                    },
                  )
                ],
              ))
        ],
      ),
    );
  }
}
