// ignore_for_file: use_build_context_synchronously

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:moviesdb_task/core/constants/app_strings.dart';
import 'package:moviesdb_task/core/enums/enums.dart';
import 'package:moviesdb_task/core/models/movie_details_model.dart';
import 'package:moviesdb_task/core/models/movies_list_api.dart';
import 'package:moviesdb_task/core/models/request_response.dart';
import 'package:moviesdb_task/core/services/database_service.dart';

class MovieDetailVm extends ChangeNotifier {

  MovieDetailVm({required this.context, required this.movieListData}) {
    init();
  }

  final BuildContext context;
  final MoviesList movieListData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  List<MovieDetailsList> _movieDetailsList = [];
  List<MovieDetailsList> get movieDetailsList => _movieDetailsList;

  setMovieDetailsData(List<MovieDetailsList> list) {
    _movieDetailsList = list;
    notifyListeners();
  }

  void init() async {

    setLoading(true);

    RequestResponse response = await DatabaseService().getMovieDetails(
        context, movieListData.id.toString());
    if (response.status == Status.success) {
      MovieDetailModel movieDetailsModel = response.data;
      setMovieDetailsData(movieDetailsModel.movieDetailsList);
      setLoading(false);
    } else {
      FlushbarHelper.createError(message: AppStrings.somethingWentWrong).show(context);
      setLoading(false);
    }
  }


}