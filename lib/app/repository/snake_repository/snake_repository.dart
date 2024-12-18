
import '../../../data/network/network_api_service.dart';
import '../../../res/app_url.dart';
import '../../model/snake/snake_model.dart';

class SnakeRepository {
  final _apiService = NetworkApiService();

  Future<SnakeModel> getSnakes() async {
    try {
      dynamic response = await _apiService.getApiResponse(AppUrl.getAllSnake);
      return SnakeModel.fromJson(response);
    } catch (e) {
      rethrow; // Allow the ViewModel to handle the error
    }
  }
}
