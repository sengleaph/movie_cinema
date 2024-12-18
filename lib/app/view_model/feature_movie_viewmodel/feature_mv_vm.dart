import 'package:flutter/material.dart';

import '../../../data/response/api_response.dart';
import '../../model/feature_movie/feature_movie.dart';
import '../../repository/feature_movie/feature_movie.dart';

class FeatureMovieViewModel extends ChangeNotifier {
  final _featureMovieRepo = FeatureMovieRepository();

  ApiResponse<List<MovieModel>> movieList = ApiResponse.loading();

  void setMovieList(ApiResponse<List<MovieModel>> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> getAllFeatureMovies() async {
    setMovieList(ApiResponse.loading());
    try {
      List<MovieModel> movies = await _featureMovieRepo.getMovies();
      setMovieList(ApiResponse.completed(movies));
    } catch (e) {
      setMovieList(ApiResponse.error(e.toString()));
    }
  }
}
