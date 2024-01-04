
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackShown;
  final String title;
  final Function()? onBackPressed;
  final List<Widget>? actions;
  final Function()? onDrawerPress;
  final bool isDrawerIconShown;

  const CustomAppBar(
      {super.key,
        this.isBackShown = false,
        required this.title,
        this.onBackPressed,
        this.actions,
        this.onDrawerPress,
        this.isDrawerIconShown = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: AppColors.primary,
      //   statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
      // ),
      // backgroundColor: AppColors.primary,
      elevation: 0,
      leading: isBackShown
          ? InkWell(
        onTap: onBackPressed,
        child: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.white,
          size: 21.sp,
        ),
      )
          : isDrawerIconShown
          ? IconButton(
        onPressed: onDrawerPress,
        icon: const Icon(Icons.menu),
        color: AppColors.white,
        tooltip: 'Drawer',
      )
          : const SizedBox(),
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
