import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monex/Theme/App_theme.dart';
import 'package:monex/Widgets/TextFields/TextFields.dart';
// import 'package:monex/Widgets/TextFields/SimpleTextField.dart';
import 'package:monex/Components/Authantication/View/SIgnUp/View/SignUp_Screen.dart';
// import 'package:monex/Components/Authantication/View/SIgnUp/View/SignUp_Screen.dart';
import 'package:monex/Widgets/Button/SocialButton.dart';
import 'package:monex/Widgets/Button/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: h * 0.04),

                        SvgPicture.asset(
                          'assets/SVG/logo.svg',
                          height: h * 0.12,
                        ),

                        SizedBox(height: h * 0.05),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                          child: SimpleTextField(
                            hint: "Username",
                            icon: Icons.person_2_outlined,
                          ),
                        ),

                        SizedBox(height: h * 0.02),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                          child: PasswordField(),
                        ),

                        SizedBox(height: h * 0.035),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.12),
                          child: GradientGlowButton(
                            onTap: () {},
                            text: "LOGIN",
                          ),
                        ),

                        SizedBox(height: h * 0.015),

                        Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: h * 0.018),
                        ),

                        SizedBox(height: h * 0.03),

                        Text("or", style: TextStyle(fontSize: h * 0.018)),

                        SizedBox(height: h * 0.02),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                          child: CustomIconButton(
                            text: "COUNTINUE WITH GOOGLE",
                            onTap: () {},
                            svgAsset: 'assets/SVG/GoogleIcon.svg',
                            expanded: true,
                          ),
                        ),

                        SizedBox(height: h * 0.02),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                          child: CustomIconButton(
                            text: "COUNTINUE WITH APPLE",
                            onTap: () {},
                            svgAsset: 'assets/SVG/AppleIcon.svg',
                            expanded: true,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: h * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: h * 0.018),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignupScreen());
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: AppThemes.lightTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.018,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
