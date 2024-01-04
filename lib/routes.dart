import 'package:flutter/material.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/search/search_screen.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/watch_screen.dart';
import 'package:moviesdb_task/ui/screens/main_screen/main_screen.dart';
import 'package:moviesdb_task/ui/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case WatchScreen.routeName:
        return MaterialPageRoute(builder: (_) => WatchScreen());

      case SearchScreen.routeName:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      // Edit Note Screen
      //   case EditNoteScreen.routeName:
      //     final NotesModel notesModel = settings.arguments as NotesModel;
      //
      //     return MaterialPageRoute(builder: (_) => EditNoteScreen(notesModel: notesModel));

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
