import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key, required this.text, required this.color,

  });

  final String text;
  final Color color;


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 4.h,
      width: 20.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Center(
        child: Text(text, style: textTheme.labelLarge!.copyWith(
          color: Colors.white,
        ),),
      ),
    );
  }
}