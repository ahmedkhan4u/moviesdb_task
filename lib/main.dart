import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:moviesdb_task/routes.dart';
import 'package:moviesdb_task/ui/screens/main_screen/main_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            scaffoldBackgroundColor: AppColors.white,
            // appBarTheme: const AppBarTheme(
            //   color: AppColors.primary,
            // ),

            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppColors.secondary,
            ),

            textTheme: GoogleFonts.poppinsTextTheme(
            ).copyWith(),
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primary,
              error: AppColors.danger,

            ),
            useMaterial3: true,
          ),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),

          initialRoute: MainScreen.routeName,
          onGenerateRoute: AppRoutes.onGenerateRoute,

        );
      }
    );
  }
}
