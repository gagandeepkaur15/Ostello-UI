import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';
import 'package:ostello/widgets/app_bar.dart';
import 'package:ostello/widgets/gradient_button.dart';

class CheckPhoneScreen extends StatelessWidget {
  const CheckPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OstelloAppBar(isBackVisible: true),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 299,
                  height: 243,
                  child: Image.asset("assets/images/check_mail.png"),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Check your phone",
                style: context.theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                "We’ve sent password recovery instruction to you via SMS",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.greyText,
                ),
              ),
              const SizedBox(height: 60),
              GradientButton(
                text: "Open email app",
                onPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Will do it later",
                style: context.theme.textTheme.displayMedium!.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "No instructions on your number? ",
                    style: context.theme.textTheme.displayMedium,
                  ),
                  Text(
                    "Resend",
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
