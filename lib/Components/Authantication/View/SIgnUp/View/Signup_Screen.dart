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

              // Back button for step 0 (optional)
              if (controller.currentStep.value > 0)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: controller.previousStep,
                    ),
                  ),
                ),

              SizedBox(height: h * 0.03),

              // Responsive Lottie Animation
              SizedBox(
                height: h * 0.15,
                child: Lottie.asset(
                  'assets/Animations/Signup.json',
                  fit: BoxFit.contain,
                  repeat: true,
                  animate: true,
                ),
              ),

              SizedBox(height: h * 0.09),

              // Step Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                    child: getStepWidget(
                      controller.currentStep.value,
                      h,
                      w,
                      context,
                    ),
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
                      return const SizedBox();
                    }),

                    Expanded(
                      child: GradientGlowButtonWrapper(controller: controller),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget getStepWidget(int step, double h, double w, BuildContext context) {
    // Check if user selected Blood Bank
    if (controller.selectedUserType.value == 1 && step > 0) {
      // Show Blood Bank specific screens
      return getBloodBankStepWidget(step, h, w, context);
    }

    // Individual flow or step 0
    switch (step) {
      case 0: // Account Type Selection
        return Column(
          key: const ValueKey(0),
          children: [
            Text(
              "Select Your Account Type",
              style: TextStyle(
                fontSize: h * 0.025,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: h * 0.04),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Individual option
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.selectedUserType.value = 0,
                    child: Container(
                      width: w * 0.4,
                      height: h * 0.25,
                      margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.selectedUserType.value == 0
                            ? Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.2)
                            : Theme.of(
                                context,
                              ).colorScheme.surface.withOpacity(0.5),
                        border: Border.all(
                          color: controller.selectedUserType.value == 0
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(
                                  context,
                                ).colorScheme.outline.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: controller.selectedUserType.value == 0
                            ? [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: h * 0.1,
                            color: controller.selectedUserType.value == 0
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.6),
                          ),
                          SizedBox(height: h * 0.015),
                          Text(
                            "Individual",
                            style: TextStyle(
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedUserType.value == 0
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: h * 0.005),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                            child: Text(
                              "Personal account",
                              style: TextStyle(
                                fontSize: h * 0.014,
                                color: controller.selectedUserType.value == 0
                                    ? Theme.of(
                                        context,
                                      ).colorScheme.primary.withOpacity(0.8)
                                    : Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withOpacity(0.6),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Blood Bank option
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.selectedUserType.value = 1,
                    child: Container(
                      width: w * 0.4,
                      height: h * 0.25,
                      margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.selectedUserType.value == 1
                            ? Theme.of(
                                context,
                              ).colorScheme.error.withOpacity(0.2)
                            : Theme.of(
                                context,
                              ).colorScheme.surface.withOpacity(0.5),
                        border: Border.all(
                          color: controller.selectedUserType.value == 1
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(
                                  context,
                                ).colorScheme.outline.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: controller.selectedUserType.value == 1
                            ? [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.error.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bloodtype,
                            size: h * 0.1,
                            color: controller.selectedUserType.value == 1
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.6),
                          ),
                          SizedBox(height: h * 0.015),
                          Text(
                            "Blood Bank",
                            style: TextStyle(
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedUserType.value == 1
                                  ? Theme.of(context).colorScheme.error
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: h * 0.005),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                            child: Text(
                              "Organization account",
                              style: TextStyle(
                                fontSize: h * 0.014,
                                color: controller.selectedUserType.value == 1
                                    ? Theme.of(
                                        context,
                                      ).colorScheme.error.withOpacity(0.8)
                                    : Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withOpacity(0.6),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.02),
            Obx(() {
              if (controller.selectedUserType.value == 0) {
                return const SizedBox();
              }
              return Text(
                "Blood Bank registration - Coming Soon",
                style: TextStyle(
                  fontSize: h * 0.016,
                  color: Theme.of(context).colorScheme.error,
                  fontStyle: FontStyle.italic,
                ),
              );
            }),
          ],
        );

      case 1: // Name Step
        return Column(
          key: const ValueKey(1),
          children: [
            Obx(
              () => SimpleTextField(
                hint: "First Name *",
                icon: Icons.person,
                controller: controller.firstNameController,
                errorText:
                    controller.isFirstNameValid.value ||
                        controller.firstNameController.text.isEmpty
                    ? null
                    : "First name is required",
              ),
            ),
            SizedBox(height: h * 0.02),
            Obx(
              () => SimpleTextField(
                hint: "Last Name *",
                icon: Icons.person,
                controller: controller.lastNameController,
                errorText:
                    controller.isLastNameValid.value ||
                        controller.lastNameController.text.isEmpty
                    ? null
                    : "Last name is required",
              ),
            ),
          ],
        );

      case 2: // NIC Step
        return Column(
          key: const ValueKey(2),
          children: [
            Obx(
              () => SimpleTextField(
                hint: "NIC Number * (13 digits)",
                icon: Icons.credit_card,
                controller: controller.nicController,
                errorText:
                    controller.isNicValid.value ||
                        controller.nicController.text.isEmpty
                    ? null
                    : "Valid 13-digit NIC required",
              ),
            ),
            SizedBox(height: h * 0.02),
            Obx(
              () => SimpleTextField(
                hint: "NIC Expiry Date *",
                icon: Icons.date_range,
                controller: controller.nicExpiryController,
                errorText:
                    controller.isNicExpiryValid.value ||
                        controller.nicExpiryController.text.isEmpty
                    ? null
                    : "Expiry date is required",
              ),
            ),
          ],
        );

      case 3: // Email Step
        return Obx(
          () => SimpleTextField(
            key: const ValueKey(3),
            hint: "Email *",
            icon: Icons.email,
            controller: controller.emailController,
            errorText:
                controller.isEmailValid.value ||
                    controller.emailController.text.isEmpty
                ? null
                : "Valid email required",
          ),
        );

      case 4: // Phone Step
        return Column(
          key: const ValueKey(4),
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Obx(
                  () => SimpleTextField(
                    hint: "Phone Number *",
                    icon: Icons.phone,
                    controller: controller.phoneController,
                    errorText:
                        controller.isPhoneValid.value ||
                            controller.phoneController.text.isEmpty
                        ? null
                        : "Phone number is required",
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: controller.otpCounter.value > 0
                        ? null
                        : controller.verifyPhone,
                    child: Text(
                      controller.isVerified.value
                          ? "Verified"
                          : controller.otpCounter.value > 0
                          ? "${controller.otpCounter.value}s"
                          : "Verify",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.02),
            Obx(
              () => controller.otpVisible.value && !controller.isVerified.value
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

      case 5: // Password Step
        return Column(
          key: const ValueKey(5),
          children: [
            Obx(
              () => SimpleTextField(
                hint: "Password *",
                icon: Icons.lock,
                controller: controller.passwordController,
                errorText:
                    controller.isPasswordValid.value ||
                        controller.passwordController.text.isEmpty
                    ? null
                    : "Meet all password requirements",
              ),
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

  Widget getBloodBankStepWidget(
    int step,
    double h,
    double w,
    BuildContext context,
  ) {
    switch (step) {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        return Column(
          key: ValueKey('bloodbank_$step'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bloodtype,
              size: h * 0.1,
              color: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: h * 0.03),
            Text(
              "Blood Bank Registration",
              style: TextStyle(
                fontSize: h * 0.028,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            SizedBox(height: h * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.1),
              child: Text(
                "Blood Bank registration is currently under development. Please check back soon for this feature.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: h * 0.018,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(height: h * 0.03),
            Container(
              padding: EdgeInsets.all(w * 0.05),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SimpleTextField(
                hint: "Enter Blood Bank Name",
                icon: Icons.bloodtype,
                controller: controller.bloodBankNameController,
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget passwordRuleRow(String text, bool passed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: passed
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    key: ValueKey('check_$text'),
                  )
                : Icon(
                    Icons.cancel,
                    color: Colors.red,
                    key: ValueKey('cancel_$text'),
                  ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: passed ? Colors.green : Colors.red,
              ),
            ),
          ),
        ],
      ),
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
      final isBloodBank = controller.selectedUserType.value == 1;

      // For Blood Bank, show "Finish" after step 0
      if (isBloodBank) {
        return GradientGlowButton(
          onTap: step == 0
              ? controller.nextStep
              : () {
                  Get.snackbar(
                    "Coming Soon",
                    "Blood Bank registration is under development",
                    backgroundColor: Theme.of(context).colorScheme.error,
                    colorText: Colors.white,
                  );
                },
          text: step == 0 ? "Next" : "Coming Soon",
        );
      }

      // For Individual flow
      final canNext = step != 4 || (step == 4 && controller.isVerified.value);

      return GradientGlowButton(
        onTap: canNext ? controller.nextStep : null,
        text: step == 5 ? "Finish" : "Next",
      );
    });
  }
}
