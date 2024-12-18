import '../../../data/network/network_api_service.dart';
import '../../../res/app_url.dart';
import '../../model/feature_movie/feature_movie.dart';

class FeatureMovieRepository {
  final _apiService = NetworkApiService();

  Future<List<MovieModel>> getMovies() async {
    try {
      dynamic responses = await _apiService.getApiResponse(AppUrl.getFeatureMovie);
      List<MovieModel> cinemas = (responses as List).map((json) => MovieModel.fromJson(json)).toList();
      return cinemas;
    } catch (e) {
      rethrow;
    }
  }
}
