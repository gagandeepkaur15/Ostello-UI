import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';
import 'package:ostello/widgets/app_bar.dart';
import 'package:ostello/widgets/gradient_button.dart';
import 'package:ostello/widgets/mobile_number_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileNumberController = TextEditingController();

    return Scaffold(
      appBar: const OstelloAppBar(isBackVisible: false),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/login.png"),
              Text(
                "Login into your account",
                style: context.theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                "Best Teacher | Affordable Pricing | Live Batches | DPP | Notes",
                style: context.theme.textTheme.displaySmall!.copyWith(
                  color: AppColors.greyText,
                ),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mobile Number",
                  style: context.theme.textTheme.displayMedium!.copyWith(
                    color: AppColors.greyText,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              TextAndNumberField(
                mobileNumberController: mobileNumberController,
                length: 10,
              ),
              const SizedBox(height: 60),
              GradientButton(
                text: "Login",
                onPressed: () {
                  if (mobileNumberController.text.length == 10) {
                    Navigator.pushNamed(
                      context,
                      '/otp_verification',
                      arguments: mobileNumberController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/forgot_password',
                      );
                    },
                    child: Text(
                      "Forgot Password? ",
                      style: context.theme.textTheme.displayMedium,
                    ),
                  ),
                  Text(
                    "Resend now in 18s ",
                    style: context.theme.textTheme.displayMedium!.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
