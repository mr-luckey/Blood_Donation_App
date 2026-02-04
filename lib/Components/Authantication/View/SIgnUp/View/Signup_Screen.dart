import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:monex/Components/Authantication/View/SIgnUp/Controller/SignUp_Controller.dart';
import 'package:monex/Widgets/Button/button.dart';
import 'package:monex/Widgets/TextFields/TextFields.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              SizedBox(height: h * 0.03),

              SizedBox(height: h * 0.03),
              // Responsive Lottie Animation
              SizedBox(
                height: h * 0.15, // 25% of screen height
                child: Lottie.asset(
                  'assets/Animations/Signup.json',
                  fit: BoxFit.contain,
                  repeat: true,
                  animate: true,
                ),
              ),
              SizedBox(height: h * 0.09),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                    child: getStepWidget(controller.currentStep.value, h),
                  ),
                ),
              ),

              SizedBox(height: h * 0.1),

              // Navigation Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Row(
                  children: [
                    Obx(() {
                      if (controller.currentStep.value > 0) {
                        return Expanded(
                          child: GradientGlowButton(
                            onTap: controller.previousStep,
                            text: "Back",
                          ),
                        );
                      }
                      return const SizedBox();
                    }),

                    Obx(() {
                      if (controller.currentStep.value > 0) {
                        return SizedBox(width: w * 0.04);
                      }
                      return SizedBox();
                    }),

                    Expanded(
                      child: GradientGlowButtonWrapper(controller: controller),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: h * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  // Step content with responsive spacing
  Widget getStepWidget(int step, double h) {
    switch (step) {
      case 0:
        return Column(
          key: const ValueKey(0),
          children: [
            SimpleTextField(
              hint: "First Name",
              icon: Icons.person,
              controller: controller.firstNameController,
            ),
            SizedBox(height: h * 0.02),
            SimpleTextField(
              hint: "Last Name",
              icon: Icons.person,
              controller: controller.lastNameController,
            ),
          ],
        );
      case 1:
        return Column(
          key: const ValueKey(1),
          children: [
            SimpleTextField(
              hint: "NIC Number (13 digits)",
              icon: Icons.credit_card,
              controller: controller.nicController,
            ),
            SizedBox(height: h * 0.02),
            SimpleTextField(
              hint: "NIC Expiry Date",
              icon: Icons.date_range,
              controller: controller.nicExpiryController,
            ),
          ],
        );
      case 2:
        return SimpleTextField(
          key: const ValueKey(2),
          hint: "Email",
          icon: Icons.email,
          controller: controller.emailController,
        );
      case 3:
        return Column(
          key: const ValueKey(3),
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                SimpleTextField(
                  hint: "Phone Number",
                  icon: Icons.phone,
                  controller: controller.phoneController,
                ),
                TextButton(
                  onPressed: controller.verifyPhone,
                  child: Obx(
                    () => Text(
                      controller.isVerified.value ? "Verified" : "Verify",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.02),
            Obx(
              () => controller.otpVisible.value
                  ? Column(
                      children: [
                        SimpleTextField(
                          hint: "Enter OTP",
                          icon: Icons.lock,
                          controller: controller.otpController,
                        ),
                        SizedBox(height: h * 0.01),
                        Text(
                          controller.otpCounter.value > 0
                              ? "Resend in ${controller.otpCounter.value}s"
                              : "OTP expired",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: h * 0.016,
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        GradientGlowButton(
                          text: "Submit OTP",
                          onTap: controller.checkOtp,
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        );
      case 4:
        return Column(
          key: const ValueKey(4),
          children: [
            SimpleTextField(
              hint: "Password",
              icon: Icons.lock,
              controller: controller.passwordController,
            ),
            SizedBox(height: h * 0.02),
            Obx(
              () => Column(
                children: [
                  passwordRuleRow(
                    "Contains capital letter",
                    controller.hasCapital.value,
                  ),
                  passwordRuleRow(
                    "Contains number",
                    controller.hasNumber.value,
                  ),
                  passwordRuleRow(
                    "Contains symbol",
                    controller.hasSpecial.value,
                  ),
                  passwordRuleRow(
                    "Minimum 8 characters",
                    controller.hasMinLength.value,
                  ),
                  passwordRuleRow(
                    "Cannot contain first/last name",
                    !controller.containsName.value,
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget passwordRuleRow(String text, bool passed) {
    return Row(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: passed
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  key: ValueKey(1),
                )
              : const Icon(Icons.cancel, color: Colors.red, key: ValueKey(2)),
        ),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class GradientGlowButtonWrapper extends StatelessWidget {
  final SignupController controller;
  const GradientGlowButtonWrapper({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final step = controller.currentStep.value;
      final canNext = step != 3 || (step == 3 && controller.isVerified.value);

      return GradientGlowButton(
        onTap: canNext ? controller.nextStep : null,
        text: step == 4 ? "Finish" : "Next",
      );
    });
  }
}
