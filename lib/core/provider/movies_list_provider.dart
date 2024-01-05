
import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/models/movies_list_api.dart';

class MoviesListProvider with ChangeNotifier {

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  setLoading(bool loading) {
    _isLoading = false;
    notifyListeners();
  }

  List<MoviesList> _moviesList = [];
  List<MoviesList> get moviesList => _moviesList;

  setMoviesList(List<MoviesList> list) {
    _moviesList = list;
    notifyListeners();
  }

}