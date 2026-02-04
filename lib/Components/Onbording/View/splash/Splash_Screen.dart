import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monex/Components/Onbording/View/Onbording/Onbording_Screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();

    // Dummy delay (simulate loading)
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnbordingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset('assets/SVG/logo.svg', width: 200, height: 200),
      ),
    );
  }
}
