import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/enums/enums.dart';
import 'package:moviesdb_task/core/models/movies_list_api.dart';
import 'package:moviesdb_task/core/models/request_response.dart';
import 'package:moviesdb_task/core/provider/movies_list_provider.dart';
import 'package:moviesdb_task/core/services/database_service.dart';
import 'package:provider/provider.dart';

class MainScreenVM with ChangeNotifier {
  MainScreenVM({required this.context}) {
    init();
  }

  BuildContext context;

  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  setSelectedIndex(int index) {
    debugPrint("Set Index : $index");
    _selectedIndex = index;
    notifyListeners();
  }

  void init() async {
    getMoviesListData();
  }

  getMoviesListData() {
    debugPrint("Calling");
    final moviesListP = Provider.of<MoviesListProvider>(context, listen: false);
    DatabaseService().getMoviesList(context).then((response) {
      // moviesListP.setLoading(true);
      if (response.status == Status.success) {
        MoviesListModel moviesListModel = response.data;
        moviesListP.setLoading(false);
        moviesListP.setMoviesList(moviesListModel.moviesList);
      }
    }).catchError((err) {
      debugPrint(
          "@Database Service, Get Movies List Api Exception => ${err.toString()}");
      moviesListP.setLoading(false);
    });
  }
}
