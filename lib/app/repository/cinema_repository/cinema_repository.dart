import '../../../data/network/network_api_service.dart';
import '../../../res/app_url.dart';
import '../../model/cinema/cinema_model.dart';

class CinemaRepository {
  final _apiService = NetworkApiService();

  Future<List<CinemaModel>> getCinema() async {
    try {
      dynamic responses = await _apiService.getApiResponse(AppUrl.getCinema);
      List<CinemaModel> cinemas = (responses as List).map((json) => CinemaModel.fromJson(json)).toList();
      return cinemas;
    } catch (e) {
      rethrow;
    }
  }
}
