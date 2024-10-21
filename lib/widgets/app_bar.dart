import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';

class OstelloAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isBackVisible;

  const OstelloAppBar(
      {super.key, this.height = kToolbarHeight, required this.isBackVisible});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      leading: isBackVisible
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : const SizedBox.shrink(),
      title: SizedBox(
        height: 44,
        width: 137,
        child: Image.asset("assets/images/ostello_logo.png"),
      ),
      centerTitle: true,
    );
  }
}
