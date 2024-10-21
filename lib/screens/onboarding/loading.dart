import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';
import 'package:ostello/widgets/app_bar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: const OstelloAppBar(isBackVisible: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 316,
              height: 219,
              child: Image.asset("assets/images/loading.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                Text(
                  "  Customizing  ",
                  style: context.theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Ostello ",
                  style: context.theme.textTheme.titleMedium!.copyWith(
                    color: context.theme.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "app as per your selection",
                  style: context.theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
