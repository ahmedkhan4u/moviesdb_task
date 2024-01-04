import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:moviesdb_task/core/constants/app_strings.dart';
import 'package:moviesdb_task/core/constants/screen_utils.dart';
import 'package:moviesdb_task/core/constants/text_styles.dart';
import 'package:moviesdb_task/ui/widgets/default_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

abstract class Utils {

  static void okAlertDialog(BuildContext context,
      {String text = "", VoidCallback? onPress, btnText = AppStrings.ok}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              height: 28.h,
              width: 90.h,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.w, top: 2.5.h, left: 5.w, bottom: 2.h),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: displayMedium,
                    ),
                  ),
                  kHeight(3.h),
                  SizedBox(
                    // width: 45.w,
                    // height: 6.h,
                    child: DefaultButton(
                      onPress: onPress ??
                              () {
                            Navigator.pop(context);
                          },
                      title: btnText ?? AppStrings.ok.toUpperCase(),
                      // title: "Ok",
                    ),
                  ),
                  kHeight(1.h),
                ],
              ),
            ),
          );
        });
  }


  static void confirmationDialog(
      BuildContext context,
      String text, {
        required VoidCallback onPress,
        VoidCallback? onCancel,
        okText = "OK",
        cancelText = "Cancel",
        isIconShown = false,
        isCancelShown = true
      }) {
    var textTheme = Theme.of(context).textTheme;
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 24.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here
            child: Container(
              height: 35.h,
              width: 90.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                // image: const DecorationImage(
                //   image: AssetImage(
                //     ImgAssets.imgPopUpBg,
                //   ),
                //   fit: BoxFit.fitWidth,
                // ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0.sp,
                  horizontal: 25.sp,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isIconShown == true
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.delete),
                        CircleAvatar(
                          backgroundColor: AppColors.secondary,
                          radius: 26.sp,
                          child: Icon(Icons.logout, color: AppColors.primary, size: 24.sp,),
                          // child: Image.asset(
                          //   height: 4.h,
                          //   ImgAssets.icInfo,
                          // ),
                        ),
                      ],
                    )
                        : const SizedBox(),
                    kHeight(1.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight(2.h),
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: displayMedium,
                          // color: Color(0xff0087E8),
                        ),
                      ],
                    ),

                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 32.w,
                            height: 5.h,
                            child: DefaultButton(
                              onPress: onPress,
                              title: okText,
                              textSize: 16.px,
                              fontWeight: FontWeight.w600,
                            )),
                        isCancelShown ? SizedBox(
                            width: 32.w,
                            height: 5.h,
                            child: DefaultButton(
                              //isLoading: ,
                              onPress: onCancel ?? () => Navigator.of(context).pop(),
                              title: cancelText,
                              textSize: 16.px,
                              fontWeight: FontWeight.w600,
                            )) : const SizedBox.shrink(),
                        // kWidth(3.w),

                        // kWidth(3.w),
                      ],
                    ),
                    kHeight(2.h),
                    // kHeight(1.h),
                  ],
                ),
              ),
            ),
          );
        });
  }


  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input; // Handle empty string case
    return input.replaceFirst(input[0], input[0].toUpperCase());
  }

  static String addOrdinalSuffix(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return 'th';
    } else {
      switch (number % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }
  }

}

