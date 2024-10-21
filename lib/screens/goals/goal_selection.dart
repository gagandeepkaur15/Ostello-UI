import 'package:flutter/material.dart';
import 'package:ostello/screens/goals/widgets/goal_cards.dart';
import 'package:ostello/theme/app_theme.dart';

class GoalSelectionScreen extends StatelessWidget {
  const GoalSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: AppColors.purple10,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the goal you want...",
              style: context.theme.textTheme.titleMedium!.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Goals can be changed at any time later",
              style: context.theme.textTheme.displaySmall!.copyWith(
                color: AppColors.greyText,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 50,
            color: AppColors.purple10,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: GoalList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
