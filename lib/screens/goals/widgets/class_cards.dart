import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';

class ClassCard extends StatelessWidget {
  final String classes;
  final String image;

  const ClassCard({
    super.key,
    required this.classes,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: context.theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.purple10,
          child: SizedBox(
            width: 19,
            height: 13,
            child: Image.asset(image),
          ),
        ),
        title: Text(
          classes,
          style: context.theme.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
