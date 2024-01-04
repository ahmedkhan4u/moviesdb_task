import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DefaultButton extends StatelessWidget {
  final BuildContext? context;
  final String title;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  final Color textColor;
  final Color buttonColor;
  final double textSize;
  final FontWeight fontWeight;
  final bool isLoading;

  const DefaultButton({
    super.key,
    required this.onPress,
    this.width,
    this.height,
    this.title = "Click Me",
    this.textColor = Colors.white,
    this.context,
    this.textSize = 18.0,
    this.fontWeight = FontWeight.w500,
    this.buttonColor = AppColors.secondary,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 6.h,
      width: width ?? 40.w,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.px),
          color: AppColors.primary
      ),
      child: Material(
        borderRadius: BorderRadius.circular(6.px),
        color: Colors.transparent,
        child: InkWell(
          //splashColor: AppColors.primary,
          borderRadius: BorderRadius.circular(6.px),
          onTap: onPress,
          child: Center(
            child: isLoading
                ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white),
            )
                : Text(
              title,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: textColor,
                  fontWeight: fontWeight,
                  fontSize: textSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
