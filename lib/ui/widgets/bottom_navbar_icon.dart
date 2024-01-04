import 'package:flutter/material.dart';

import '../../core/constants/screen_utils.dart';

class BottomNavbarIcon extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  // final IconData icon;
  final String icon;
  final Color? color;

  const BottomNavbarIcon({super.key, required this.title,
    required this.onTap, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: theme.colorScheme.secondary,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 24, height: 24, color: color ?? theme.iconTheme.color,),
              // Icon(
              //   icon,
              //   color: color ?? theme.iconTheme.color,
              // ),
              kHeight(2),
              Text(
                title,
                style: theme.textTheme.labelSmall!
                    .copyWith(color: color ?? theme.iconTheme.color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
