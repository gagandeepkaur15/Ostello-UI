import 'package:flutter/material.dart';
import 'package:ostello/screens/goals/widgets/goals_list.dart';
import 'package:ostello/theme/app_theme.dart';

class GoalCard extends StatelessWidget {
  final String goalTitle;
  final String classes;
  final String image;
  final bool isBorder;
  final String heroTag;

  const GoalCard({
    super.key,
    required this.goalTitle,
    required this.classes,
    required this.image,
    required this.isBorder,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Card(
        elevation: 1,
        color: context.theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isBorder
              ? const BorderSide(color: Color(0xFFAC68F8), width: 1)
              : BorderSide.none,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.purple10,
            child: Image.asset(image),
          ),
          title: Text(
            goalTitle,
            style: context.theme.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            classes,
            style: context.theme.textTheme.bodySmall!
                .copyWith(color: AppColors.greyText),
          ),
          trailing: isBorder
              ? Radio(value: '', groupValue: '', onChanged: (_) {})
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class GoalList extends StatelessWidget {
  const GoalList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> goals = goalsList;

    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/class_selection',
              arguments: index,
            );
          },
          child: GoalCard(
            goalTitle: goals[index]['title'],
            classes: goals[index]['classes'],
            image: goals[index]['image'],
            isBorder: false,
            heroTag: 'goal_card_$index',
          ),
        );
      },
    );
  }
}
