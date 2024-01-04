import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool? enabled;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final double? buttonHeight;
  final double? buttonWidth;
  final int? textlength;
  final bool? showhint;
  final double? rightpadding;
  final String? limittext;

  final void Function(String)? onChanged;

  // String inputformatername;

  const DefaultTextField({super.key,

    this.controller,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.labelText,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.enabled,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.textStyle,
    this.hintStyle,
    this.buttonHeight,
    this.buttonWidth,
    this.textlength,
    this.limittext,
    this.rightpadding,
    this.prefixIcon,
    this.onChanged,

    // this.inputFormatters = "[A-Za-z0-9@-_/., ']",

    this.inputFormatters,
    this.showhint,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData theme = Theme.of(context);

    return Container(
      height: buttonHeight,
      // color: AppColors.lightGreyBg,
      margin: EdgeInsets.only(bottom: 1.5.h),
      child: TextFormField(
        onChanged: onChanged,
        style: textStyle ??
            textTheme.bodyMedium!.copyWith(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),

        enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        // inputFormatters: [
        //   FilteringTextInputFormatter.allow(
        //       RegExp(inputformatername.toString())),
        // ],
        controller: controller,
        readOnly: readOnly,
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: textlength,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          counterText: showhint == true ? null : "",
          suffixText: limittext,
          suffixStyle: GoogleFonts.openSans(fontSize: 12.sp, color: AppColors.danger),
          hintStyle: hintStyle ?? textTheme.bodyMedium!.copyWith(color: AppColors.mediumTint),
          contentPadding: EdgeInsets.only(
              left: 5.w, bottom: 3.5.h, right: rightpadding ?? 5.w),
          fillColor: AppColors.lightShade,
          // fillColor: theme.colorScheme.secondary.withOpacity(0.1),
          filled: true,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0.px),
            borderSide: const BorderSide(
              color: AppColors.lightShade,
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0.px),
            borderSide: BorderSide(
              color: AppColors.lightShade,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0.px),
            borderSide: BorderSide(
              color: AppColors.lightShade,
              width: 2,
            ),
          ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(12.0.px),
          //   borderSide: const BorderSide(
          //     color: AppColors.borderBlueColor,
          //     width: 2,
          //   ),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(12.0.px),
          //   borderSide: const BorderSide(
          //     color: AppColors.borderBlueColor,
          //     width: 2,
          //   ),
          // ),
          // errorText: "abc",
          // errorStyle: TextStyle(fontSize: 0.1.px),
        ),
      ),
    );
  }
}
