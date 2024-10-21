import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';
import 'package:ostello/widgets/app_bar.dart';
import 'package:ostello/widgets/gradient_button.dart';
import 'package:ostello/widgets/mobile_number_field.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: const OstelloAppBar(isBackVisible: true),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 240,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD69FB1),
                ),
                child: Center(
                  child: SizedBox(
                    height: 250,
                    child: Image.asset("assets/images/name.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "What is your name",
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
              TextAndNumberField(
                mobileNumberController: nameController,
                length: 3,
                inputPhone: false,
              ),
              const SizedBox(height: 60),
              GradientButton(
                text: "Next",
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      '/mobile_number',
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: context.theme.textTheme.displayMedium,
                  ),
                  Text(
                    "Login",
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
