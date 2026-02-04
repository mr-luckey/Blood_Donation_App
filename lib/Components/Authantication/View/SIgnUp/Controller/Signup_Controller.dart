// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignupController extends GetxController {
//   // Current step index
//   final currentStep = 0.obs;

//   // Step TextControllers
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final nicController = TextEditingController();
//   final nicExpiryController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();
//   final passwordController = TextEditingController();

//   // OTP Timer
//   final otpCounter = 60.obs;
//   Timer? _otpTimer;

//   // Password rule checks
//   final hasCapital = false.obs;
//   final hasNumber = false.obs;
//   final hasSpecial = false.obs;
//   final hasMinLength = false.obs;
//   final containsName = false.obs;

//   // Step navigation
//   void nextStep() {
//     if (currentStep.value < 4) currentStep.value++;
//   }

//   void previousStep() {
//     if (currentStep.value > 0) currentStep.value--;
//   }

//   // Start OTP countdown
//   void startOtpTimer() {
//     otpCounter.value = 60;
//     _otpTimer?.cancel();
//     _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (otpCounter.value > 0) {
//         otpCounter.value--;
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   // Validate NIC: 13 digits only
//   bool isValidNIC(String nic) {
//     return RegExp(r'^\d{13}$').hasMatch(nic);
//   }

//   // Check password rules
//   void checkPasswordRules(String password) {
//     hasCapital.value = password.contains(RegExp(r'[A-Z]'));
//     hasNumber.value = password.contains(RegExp(r'\d'));
//     hasSpecial.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//     hasMinLength.value = password.length >= 8;
//     containsName.value =
//         (password.toLowerCase().contains(
//           firstNameController.text.toLowerCase(),
//         ) ||
//         password.toLowerCase().contains(lastNameController.text.toLowerCase()));
//   }

//   @override
//   void onClose() {
//     _otpTimer?.cancel();
//     super.onClose();
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Current step index
  final currentStep = 0.obs;

  // Step TextControllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nicController = TextEditingController();
  final nicExpiryController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();

  // OTP Timer
  final otpCounter = 60.obs;
  Timer? _otpTimer;

  // Phone verification
  final otpVisible = false.obs; // OTP field visibility
  final isVerified = false.obs; // Phone verified

  // Password rule checks
  final hasCapital = false.obs;
  final hasNumber = false.obs;
  final hasSpecial = false.obs;
  final hasMinLength = false.obs;
  final containsName = false.obs;

  // Step navigation
  void nextStep() {
    if (currentStep.value < 4) {
      // Step 3 (phone) requires verification
      if (currentStep.value == 3 && !isVerified.value) {
        Get.snackbar("Warning", "Please verify your phone first");
        return;
      }
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  // OTP functionality
  void verifyPhone() {
    if (phoneController.text.isEmpty) {
      Get.snackbar("Error", "Please enter your phone number");
      return;
    }
    otpVisible.value = true;
    otpCounter.value = 60;
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (otpCounter.value > 0) {
        otpCounter.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void checkOtp() {
    if (otpController.text == '0000') {
      isVerified.value = true;
      _otpTimer?.cancel();
      otpCounter.value = 0;
      Get.snackbar("Success", "Phone verified!");
    } else {
      Get.snackbar("Error", "Incorrect OTP");
    }
  }

  // Start OTP countdown manually (optional)
  void startOtpTimer() {
    otpCounter.value = 60;
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (otpCounter.value > 0) {
        otpCounter.value--;
      } else {
        timer.cancel();
      }
    });
  }

  // Validate NIC: 13 digits only
  bool isValidNIC(String nic) {
    return RegExp(r'^\d{13}$').hasMatch(nic);
  }

  // Check password rules
  void checkPasswordRules(String password) {
    hasCapital.value = password.contains(RegExp(r'[A-Z]'));
    hasNumber.value = password.contains(RegExp(r'\d'));
    hasSpecial.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasMinLength.value = password.length >= 8;
    containsName.value =
        (password.toLowerCase().contains(
          firstNameController.text.toLowerCase(),
        ) ||
        password.toLowerCase().contains(lastNameController.text.toLowerCase()));
  }

  // Helper: check if Next button should be enabled
  bool canProceedNextStep() {
    if (currentStep.value == 3) {
      return isVerified.value;
    }
    return true;
  }

  @override
  void onClose() {
    _otpTimer?.cancel();
    firstNameController.dispose();
    lastNameController.dispose();
    nicController.dispose();
    nicExpiryController.dispose();
    emailController.dispose();
    phoneController.dispose();
    otpController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
