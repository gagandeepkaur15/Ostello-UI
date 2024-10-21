import 'package:flutter/material.dart';
import 'package:ostello/screens/forgot_password/check_mail.dart';
import 'package:ostello/screens/forgot_password/check_phone.dart';
import 'package:ostello/screens/forgot_password/forgot_password.dart';
import 'package:ostello/screens/goals/class_selection.dart';
import 'package:ostello/screens/goals/goal_selection.dart';
import 'package:ostello/screens/login.dart';
import 'package:ostello/screens/onboarding/loading.dart';
import 'package:ostello/screens/onboarding/mobile_number.dart';
import 'package:ostello/screens/onboarding/name.dart';
import 'package:ostello/screens/onboarding/otp.dart';
import 'package:ostello/screens/otp_verification.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    case '/otp_verification':
      final String number = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OtpVerificationScreen(number: number),
      );

    case '/name':
      return MaterialPageRoute(
        builder: (context) => const NameScreen(),
      );

    case '/mobile_number':
      return MaterialPageRoute(
        builder: (context) => const MobileNumberScreen(),
      );

    case '/onboarding_otp':
      final String number = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OnboardingOtpVerificationScreen(
          number: number,
        ),
      );

    case '/goal_selection':
      return MaterialPageRoute(
        builder: (context) => const GoalSelectionScreen(),
      );

    case '/class_selection':
      final int index = settings.arguments as int;
      return MaterialPageRoute(
        builder: (context) => ClassSelectionScreen(goalIndex: index),
      );

    case '/forgot_password':
      return MaterialPageRoute(
        builder: (context) => const ForgotPasswordScreen(),
      );

    case '/check_mail':
      return MaterialPageRoute(
        builder: (context) => const CheckMailScreen(),
      );

    case '/check_phone':
      return MaterialPageRoute(
        builder: (context) => const CheckPhoneScreen(),
      );

    case '/loading':
      return MaterialPageRoute(
        builder: (context) => const LoadingScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
  }
}
