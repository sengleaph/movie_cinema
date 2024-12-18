import 'package:flutter/material.dart';
import '../../../data/response/api_response.dart';
import '../../repository/cinema_repository/cinema_repository.dart';
import '../../model/cinema/cinema_model.dart';

class CinemaViewModel extends ChangeNotifier {
  final _cineRepo = CinemaRepository();

  ApiResponse<List<CinemaModel>> cinemaList = ApiResponse.loading();

  setCinemaList(ApiResponse<List<CinemaModel>> response) {
    cinemaList = response;
    notifyListeners();
  }

  Future<void> getAllCinemas() async {
    setCinemaList(ApiResponse.loading());
    try {
      List<CinemaModel> cinemas = await _cineRepo.getCinema();
      setCinemaList(ApiResponse.completed(cinemas));
    } catch (e) {
      setCinemaList(ApiResponse.error(e.toString()));
    }
  }
}
