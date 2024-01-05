import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/models/movie_details_model.dart';
import 'package:moviesdb_task/core/models/movies_list_api.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/movie_details/movie_details_screen.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/movie_details/watch_trailer/watch_trailer.dart';
import 'package:moviesdb_task/ui/screens/main_screen/main_screen.dart';
import 'package:moviesdb_task/ui/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

        case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainScreen());

        case MovieDetailScreen.routeName:
        final MoviesList movieListItem = settings.arguments as MoviesList;
          return MaterialPageRoute(builder: (_) =>
              MovieDetailScreen(movieListItem: movieListItem));

          case WatchTrailerScreen.routeName:
        final MovieDetailsList movieDetailsList = settings.arguments as MovieDetailsList;
          return MaterialPageRoute(builder: (_) =>
              WatchTrailerScreen(movieDetailModel: movieDetailsList,));

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
