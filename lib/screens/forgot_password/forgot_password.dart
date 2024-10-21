import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';
import 'package:ostello/widgets/app_bar.dart';
import 'package:ostello/widgets/custom_textfields.dart';
import 'package:ostello/widgets/gradient_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    bool containsAtSymbol() {
      return textController.text.contains('@');
    }

    return Scaffold(
      appBar: const OstelloAppBar(isBackVisible: true),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 299,
                  height: 243,
                  child: Image.asset("assets/images/forgot_password.png"),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Forgot Password",
                style: context.theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                "Enter your registered email ID or Phone number",
                maxLines: 2,
                style: context.theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.greyText,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                helperText: "Email address or Phone number",
                controller: textController,
              ),
              const SizedBox(height: 60),
              GradientButton(
                text: "Login",
                onPressed: () {
                  if (containsAtSymbol()) {
                    Navigator.pushNamed(context, '/check_mail');
                  } else {
                    Navigator.pushNamed(context, '/check_phone');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
