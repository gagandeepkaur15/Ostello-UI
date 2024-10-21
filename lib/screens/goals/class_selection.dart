import 'package:flutter/material.dart';
import 'package:ostello/screens/goals/widgets/class_cards.dart';
import 'package:ostello/screens/goals/widgets/goal_cards.dart';
import 'package:ostello/screens/goals/widgets/goals_list.dart';
import 'package:ostello/theme/app_theme.dart';

class ClassSelectionScreen extends StatelessWidget {
  final int goalIndex;
  const ClassSelectionScreen({super.key, required this.goalIndex});

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
        title: Text(
          "Select the class you are in...",
          style: context.theme.textTheme.titleMedium!.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 50,
            color: AppColors.purple10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GoalCard(
                  goalTitle: goalsList[goalIndex]['title'],
                  classes: goalsList[goalIndex]['classes'],
                  image: goalsList[goalIndex]['image'],
                  isBorder: true,
                   heroTag: 'goal_card_$goalIndex', 
                ),
                const SizedBox(height: 20),
                Text(
                  "Select Class",
                  style: context.theme.textTheme.displayMedium!.copyWith(
                    color: AppColors.greyText,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/loading',
                    );
                  },
                  child: const ClassCard(
                    classes: '11th Class',
                    image: "assets/images/people.png",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/loading',
                    );
                  },
                  child: const ClassCard(
                    classes: '12th Class',
                    image: "assets/images/people.png",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/loading',
                    );
                  },
                  child: const ClassCard(
                    classes: 'Dropper',
                    image: "assets/images/people.png",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
