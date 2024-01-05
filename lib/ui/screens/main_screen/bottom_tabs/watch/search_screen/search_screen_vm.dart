import 'package:flutter/cupertino.dart';
import 'package:moviesdb_task/core/models/movies_list_api.dart';
import 'package:moviesdb_task/core/provider/movies_list_provider.dart';
import 'package:provider/provider.dart';

class SearchScreenVm extends ChangeNotifier {
  final searchC = TextEditingController();

  List<MoviesList> _moviesList = [];
  List<MoviesList> _moviesListBackup = [];

  List<MoviesList> get moviesList => _moviesList;

  List<MoviesList> get moviesListBackup => _moviesListBackup;

  late final MoviesListProvider moviesListProvider;
  final BuildContext context;

  SearchScreenVm({required this.context}) {
    init();
  }

  void init() {
    moviesListProvider =
        Provider.of<MoviesListProvider>(context, listen: false);
    _moviesList.addAll(moviesListProvider.moviesList);
    _moviesListBackup.addAll(moviesListProvider.moviesList);
    notifyListeners();
  }

  void filterData(String searchText) {
    debugPrint("Search Text $searchText");
    if (searchText.isEmpty) {
      _moviesList.addAll(_moviesListBackup);
      notifyListeners();
      return;
    }

    _moviesList = moviesListBackup
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void clearController() {
    searchC.clear();
    _moviesList = moviesListBackup;
    notifyListeners();
  }
}
