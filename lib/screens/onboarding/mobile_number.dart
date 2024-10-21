import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';
import 'package:ostello/widgets/app_bar.dart';
import 'package:ostello/widgets/gradient_button.dart';
import 'package:ostello/widgets/mobile_number_field.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileNumberController = TextEditingController();

    return Scaffold(
      appBar: const OstelloAppBar(isBackVisible: true),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 215,
                height: 237,
                child: Image.asset("assets/images/onboarding_mobile.png"),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Enter your Mobile Number",
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
                text: "Send OTP",
                onPressed: () {
                  if (mobileNumberController.text.length == 10) {
                    Navigator.pushNamed(
                      context,
                      '/onboarding_otp',
                      arguments: mobileNumberController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "By creating an account, you agree to our ",
                    style: context.theme.textTheme.displayMedium!.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "Terms and Conditions",
                    style: context.theme.textTheme.displayMedium!.copyWith(
                      color: context.theme.primaryColor,
                      fontSize: 10,
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
