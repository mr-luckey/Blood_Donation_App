import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monex/Components/Authantication/View/Login/View/Login_Screen.dart';
import 'package:monex/Widgets/Button/button.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = size.width / 375; // base width

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100 * scale),
          child: IntroductionScreen(
            autoScrollDuration: 3000,
            pages: [
              _buildPageViewModel(scale),
              _buildPageViewModel2(scale),
              _buildPageViewModel3(scale),
            ],
            onDone: () {},
            onSkip: () {},
            showSkipButton: false,
            showNextButton: true,
            next: Icon(Icons.arrow_forward_ios, size: 20 * scale),
            done: GradientGlowButton(
              onTap: () {
                Get.to(const LoginScreen());
              },
              text: "Let's Go",
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel _buildPageViewModel(double scale) {
    return PageViewModel(
      title: "Note Down Your Expenses",
      body:
          "Keep track of your spending habits and manage your finances effectively.",
      image: SvgPicture.asset(
        'assets/SVG/onbord1.svg',
        width: 280 * scale,
        height: 280 * scale,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 18 * scale,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 14 * scale),
        imagePadding: EdgeInsets.only(top: 20 * scale),
      ),
    );
  }

  PageViewModel _buildPageViewModel2(double scale) {
    return PageViewModel(
      title: "Simple Money Management",
      body:
          "Easily categorize your expenses and visualize your financial health with intuitive charts and insights.",
      image: SvgPicture.asset(
        'assets/SVG/onbord2.svg',
        width: 280 * scale,
        height: 280 * scale,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 20 * scale,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 15 * scale),
        imagePadding: EdgeInsets.only(top: 20 * scale),
      ),
    );
  }

  PageViewModel _buildPageViewModel3(double scale) {
    return PageViewModel(
      title: "Easy to Track and Analyze",
      body:
          "Track your expenses in real-time and analyze your spending patterns to make informed financial decisions.",
      image: SvgPicture.asset(
        'assets/SVG/onbord3.svg',
        width: 280 * scale,
        height: 280 * scale,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 20 * scale,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 15 * scale),
        imagePadding: EdgeInsets.only(top: 20 * scale),
      ),
    );
  }
}
