import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:moviesdb_task/core/constants/img_assets.dart';
import 'package:moviesdb_task/core/constants/screen_utils.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/watch_screen.dart';
import 'package:moviesdb_task/ui/screens/main_screen/main_screen_vm.dart';
import 'package:moviesdb_task/ui/widgets/bottom_navbar_icon.dart';
import 'package:moviesdb_task/ui/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/main_screen";

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainScreenVM(),
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: const CustomAppBar(title: "Main Screen"),
        body: Consumer<MainScreenVM>(
          builder: (context, vm, child) {
            return Container(
              child: switch (vm.selectedIndex) {
                0 => const SizedBox(),
                1 => const WatchScreen(),
                2 => const SizedBox(),
                3 => const SizedBox(),
                _ => const SizedBox()
              },
            );
          },
        ),
        bottomNavigationBar: Consumer<MainScreenVM>(
          builder: (context, vm, child) {
            return Container(
              alignment: Alignment.center,
              height: 72,

              decoration: const BoxDecoration(
                color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
              ),
              child: BottomAppBar(
                color: Colors.transparent,
                shape: const CircularNotchedRectangle(),
                child: SizedBox(
                  // height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BottomNavbarIcon(
                        onTap: () {
                          vm.setSelectedIndex(0);
                        },
                        title: "Dashboard",
                        icon: ImgAssets.icDashboard,
                        color: vm.selectedIndex == 0
                            ? AppColors.white
                            : AppColors.mediumShade,
                      ),
                      kWidth(8.w),
                      BottomNavbarIcon(
                        onTap: () {
                          vm.setSelectedIndex(1);
                        },
                        title: "Watch",
                        icon: ImgAssets.icWatch,
                        color: vm.selectedIndex == 1
                            ? AppColors.white
                            : AppColors.mediumShade,
                      ),
                      kWidth(8.w),
                      BottomNavbarIcon(
                        onTap: () {
                          vm.setSelectedIndex(2);
                        },
                        title: "Media Library",
                        icon: ImgAssets.icMediaLibrary,
                        color: vm.selectedIndex == 2
                            ? AppColors.white
                            : AppColors.mediumShade,
                      ),
                      kWidth(8.w),
                      BottomNavbarIcon(
                        onTap: () {
                          vm.setSelectedIndex(3);
                        },
                        title: "More",
                        icon: ImgAssets.icMore,
                        color: vm.selectedIndex == 3
                            ? AppColors.white
                            : AppColors.mediumShade,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
