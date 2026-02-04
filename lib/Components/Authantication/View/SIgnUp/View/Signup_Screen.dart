import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monex/Components/Authantication/View/SIgnUp/Controller/SignUp_Controller.dart';
import 'package:monex/Widgets/Button/button.dart';
import 'package:monex/Components/Authantication/View/Login/Widgets/SimpleTextField.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Step content (only this depends on currentStep)
                        Obx(
                          () => AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(
                                  scale: animation,
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                ),
                            child: getStepWidget(controller.currentStep.value),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Navigation buttons
                        Row(
                          children: [
                            // Back button
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
                                return const SizedBox(width: 16);
                              }
                              return const SizedBox();
                            }),

                            // Next / Finish button
                            Expanded(
                              child: GradientGlowButtonWrapper(
                                controller: controller,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Step content
  Widget getStepWidget(int step) {
    switch (step) {
      case 0:
        return Column(
          key: const ValueKey(0),
          children: [
            Simpletextfield(
              hint: "First Name",
              icon: Icons.person,
              controller: controller.firstNameController,
            ),
            const SizedBox(height: 16),
            Simpletextfield(
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
            Simpletextfield(
              hint: "NIC Number (13 digits)",
              icon: Icons.credit_card,
              controller: controller.nicController,
            ),
            const SizedBox(height: 16),
            Simpletextfield(
              hint: "NIC Expiry Date",
              icon: Icons.date_range,
              controller: controller.nicExpiryController,
            ),
          ],
        );
      case 2:
        return Simpletextfield(
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
                Simpletextfield(
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
            const SizedBox(height: 16),
            Obx(
              () => controller.otpVisible.value
                  ? Column(
                      children: [
                        Simpletextfield(
                          hint: "Enter OTP",
                          icon: Icons.lock,
                          controller: controller.otpController,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          controller.otpCounter.value > 0
                              ? "Resend in ${controller.otpCounter.value}s"
                              : "OTP expired",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
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
            Simpletextfield(
              hint: "Password",
              icon: Icons.lock,
              controller: controller.passwordController,
            ),
            const SizedBox(height: 16),
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
        const SizedBox(width: 8),
        Text(text),
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
