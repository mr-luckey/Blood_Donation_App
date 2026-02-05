import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Current step index
  final currentStep = 0.obs;
  final selectedUserType = 0.obs; // 0 for Individual, 1 for Blood Bank

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
  final otpVisible = false.obs;
  final isVerified = false.obs;

  // Password rule checks
  final hasCapital = false.obs;
  final hasNumber = false.obs;
  final hasSpecial = false.obs;
  final hasMinLength = false.obs;
  final containsName = false.obs;

  // Field validation flags
  final isFirstNameValid = false.obs;
  final isLastNameValid = false.obs;
  final isNicValid = false.obs;
  final isNicExpiryValid = false.obs;
  final isEmailValid = false.obs;
  final isPhoneValid = false.obs;
  final isPasswordValid = false.obs;

  final bloodBankNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    // Listen to all text controllers for real-time validation
    firstNameController.addListener(() {
      validateFirstName();
      if (passwordController.text.isNotEmpty) {
        checkPasswordRules(passwordController.text);
      }
    });

    lastNameController.addListener(() {
      validateLastName();
      if (passwordController.text.isNotEmpty) {
        checkPasswordRules(passwordController.text);
      }
    });

    nicController.addListener(() => validateNIC());
    nicExpiryController.addListener(() => validateNicExpiry());
    emailController.addListener(() => validateEmail());
    phoneController.addListener(() => validatePhone());
    passwordController.addListener(
      () => checkPasswordRules(passwordController.text),
    );
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  // Validate current step fields
  bool validateCurrentStep() {
    // If Blood Bank is selected, allow navigation through steps
    if (selectedUserType.value == 1) {
      return true; // Skip validation for Blood Bank for now
    }

    // Individual flow validation
    switch (currentStep.value) {
      case 0: // Account Type
        return validateUserTypeStep();
      case 1: // Name
        return validateNameStep();
      case 2: // NIC
        return validateNicStep();
      case 3: // Email
        return validateEmailStep();
      case 4: // Phone
        return validatePhoneStep();
      case 5: // Password
        return validatePasswordStep();
      default:
        return false;
    }
  }

  bool validateUserTypeStep() {
    // User must select either Individual or Blood Bank
    return selectedUserType.value == 0 || selectedUserType.value == 1;
  }

  void validateFirstName() {
    isFirstNameValid.value = firstNameController.text.trim().isNotEmpty;
  }

  void validateLastName() {
    isLastNameValid.value = lastNameController.text.trim().isNotEmpty;
  }

  void validateNIC() {
    isNicValid.value = isValidNIC(nicController.text);
  }

  void validateNicExpiry() {
    isNicExpiryValid.value = nicExpiryController.text.trim().isNotEmpty;
  }

  void validateEmail() {
    final email = emailController.text.trim();
    isEmailValid.value = email.isNotEmpty && isValidEmail(email);
  }

  void validatePhone() {
    isPhoneValid.value = phoneController.text.trim().isNotEmpty;
  }

  bool validateNameStep() {
    validateFirstName();
    validateLastName();

    if (!isFirstNameValid.value) {
      Get.snackbar("Error", "First name is required");
      return false;
    }
    if (!isLastNameValid.value) {
      Get.snackbar("Error", "Last name is required");
      return false;
    }
    return true;
  }

  bool validateNicStep() {
    validateNIC();
    validateNicExpiry();

    if (!isNicValid.value) {
      Get.snackbar("Error", "Please enter a valid 13-digit NIC number");
      return false;
    }
    if (!isNicExpiryValid.value) {
      Get.snackbar("Error", "NIC expiry date is required");
      return false;
    }
    return true;
  }

  bool validateEmailStep() {
    validateEmail();

    if (!isEmailValid.value) {
      Get.snackbar("Error", "Please enter a valid email address");
      return false;
    }
    return true;
  }

  bool validatePhoneStep() {
    validatePhone();

    if (!isPhoneValid.value) {
      Get.snackbar("Error", "Phone number is required");
      return false;
    }
    if (!isVerified.value) {
      Get.snackbar("Warning", "Please verify your phone number first");
      return false;
    }
    return true;
  }

  bool validatePasswordStep() {
    checkPasswordRules(passwordController.text);

    final allRulesPassed =
        hasCapital.value &&
        hasNumber.value &&
        hasSpecial.value &&
        hasMinLength.value &&
        !containsName.value;

    isPasswordValid.value = allRulesPassed;

    if (!isPasswordValid.value) {
      Get.snackbar("Error", "Please meet all password requirements");
      return false;
    }
    return true;
  }

  // Email validation
  bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  // OTP functionality
  void verifyPhone() {
    if (phoneController.text.isEmpty) {
      Get.snackbar("Error", "Please enter your phone number");
      return;
    }

    otpVisible.value = true;
    isVerified.value = false;
    otpCounter.value = 60;
    _otpTimer?.cancel();

    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (otpCounter.value > 0) {
        otpCounter.value--;
      } else {
        timer.cancel();
        otpVisible.value = false;
      }
    });

    // In real app, you would call your OTP API here
    // For demo, we'll auto-fill with 0000
    otpController.text = '0000';
    Get.snackbar("OTP Sent", "Check your phone for OTP (Demo: 0000)");
  }

  void checkOtp() {
    if (otpController.text.isEmpty) {
      Get.snackbar("Error", "Please enter OTP");
      return;
    }

    // Demo validation - accept any 4 digit OTP
    if (otpController.text.length == 4) {
      isVerified.value = true;
      _otpTimer?.cancel();
      otpCounter.value = 0;
      otpVisible.value = false;
      Get.snackbar("Success", "Phone verified successfully!");
    } else {
      Get.snackbar("Error", "Invalid OTP. Please try again.");
    }
  }

  // Validate NIC: 13 digits only
  bool isValidNIC(String nic) {
    return RegExp(r'^\d{13}$').hasMatch(nic.trim());
  }

  // Check password rules
  void checkPasswordRules(String password) {
    hasCapital.value = password.contains(RegExp(r'[A-Z]'));
    hasNumber.value = password.contains(RegExp(r'\d'));
    hasSpecial.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasMinLength.value = password.length >= 8;

    final firstName = firstNameController.text.trim().toLowerCase();
    final lastName = lastNameController.text.trim().toLowerCase();

    containsName.value =
        (firstName.isNotEmpty && password.toLowerCase().contains(firstName)) ||
        (lastName.isNotEmpty && password.toLowerCase().contains(lastName));

    // Update overall password validity
    isPasswordValid.value =
        hasCapital.value &&
        hasNumber.value &&
        hasSpecial.value &&
        hasMinLength.value &&
        !containsName.value;
  }

  void nextStep() {
    // For Blood Bank, just move through steps without validation
    if (selectedUserType.value == 1) {
      if (currentStep.value < 5) {
        currentStep.value++;
      }
      return;
    }

    // For Individual, validate before proceeding
    if (!validateCurrentStep()) {
      return;
    }

    if (currentStep.value < 5) {
      // Step 4 (phone) requires verification
      if (currentStep.value == 4 && !isVerified.value) {
        Get.snackbar("Warning", "Please verify your phone first");
        return;
      }
      currentStep.value++;
    } else if (currentStep.value == 5) {
      // Finish signup
      Get.snackbar("Success", "Account created successfully!");
      // Here you would call your API to create the account
    }
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
