import 'package:flutter/material.dart';
import '../../../data/response/api_response.dart';
import '../../model/snake/snake_model.dart';
import '../../repository/snake_repository/snake_repository.dart';

class SnakeViewModel extends ChangeNotifier {
  final _snakeRepo = SnakeRepository();

  ApiResponse<SnakeModel> response = ApiResponse.loading();

  setProductList(ApiResponse<SnakeModel> newResponse) {
    response = newResponse;
    notifyListeners();
  }

  Future<void> getAllSnakes() async {
    await _snakeRepo.getSnakes().then((snakes) {
      setProductList(ApiResponse.completed(snakes));
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
      debugPrint("Error: $error");
    });
  }
}
