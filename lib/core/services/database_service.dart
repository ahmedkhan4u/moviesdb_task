import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:moviesdb_task/core/constants/app_configs.dart';
import 'package:moviesdb_task/core/constants/app_strings.dart';
import 'package:moviesdb_task/core/models/movie_details_model.dart';
import 'package:moviesdb_task/core/models/movies_list_api.dart';
import 'package:moviesdb_task/core/models/request_response.dart';

import '../enums/enums.dart';
import 'network_service.dart';

abstract class DBBase {
  Future<RequestResponse> getMoviesList(BuildContext context);
  Future<RequestResponse> getMovieDetails(BuildContext context, String movieId);
}

class DatabaseService extends DBBase {
  @override
  Future<RequestResponse> getMoviesList(BuildContext context) async {
    try {
      Response response = await NetworkService()
          .getGetApiResponse("${AppConfigs.baseUrl}${AppConfigs.upcoming}"
          "?api_key=${AppConfigs.apiKey}");

      debugPrint("@Database Service, Get Movies List Status Code =>${response.statusCode}");
      debugPrint(
          "@Database Service, Get Movies List Data Response => ${response.body.toString()}");

      if (response.statusCode == 200) {
        MoviesListModel moviesListModel = moviesListModelFromJson(response.body);
        debugPrint(
            "@Database Service, Get Movies List Data Response Length => ${moviesListModel.moviesList.length}");

        return RequestResponse(
            status: Status.success,
            msg: "Movies data fetched successfully",
            data: moviesListModel);
      } else {
        return RequestResponse(
            status: Status.failed,
            msg: AppStrings.somethingWentWrong,
            data: []);
      }
    } catch (ex) {
      debugPrint(
          "@Database Service, Get Movies List Api Exception => ${ex.toString()}");
      return RequestResponse(
          status: Status.failed, msg: AppStrings.somethingWentWrong, data: []);
    }
  }

  @override
  Future<RequestResponse> getMovieDetails(BuildContext context, String movieId) async {
    // try {
      Response response = await NetworkService()
          .getGetApiResponse("${AppConfigs.baseUrl}$movieId/${AppConfigs.videos}"
          "?api_key=${AppConfigs.apiKey}");

      debugPrint("@Database Service, Get Movies Details Status Code =>${response.statusCode}");
      debugPrint(
          "@Database Service, Get Movies Details Data Response => ${response.body.toString()}");

      if (response.statusCode == 200) {
        MovieDetailModel moviesListModel = movieDetailModelFromJson(response.body);
        debugPrint(
            "@Database Service, Get Movies Details Data Response Length => ${moviesListModel.movieDetailsList.length}");

        return RequestResponse(
            status: Status.success,
            msg: "Movies data fetched successfully",
            data: moviesListModel);
      } else {
        return RequestResponse(
            status: Status.failed,
            msg: AppStrings.somethingWentWrong,
            data: []);
      }
    // } catch (ex) {
    //   debugPrint(
    //       "@Database Service, Get Movies Details Api Exception => ${ex.toString()}");
    //   return RequestResponse(
    //       status: Status.failed, msg: AppStrings.somethingWentWrong, data: []);
    // }
  }
}

