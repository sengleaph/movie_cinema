import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl{
  static String baseUrl = "${dotenv.env["BASE_URL"]}/";
  static String getCinema = "${baseUrl}cinemas";
  static String getFeatureMovie = "${baseUrl}scheduled-films/featured";
  static String getPromotion = "${baseUrl}promotions?limit=10&offset=0&includeAnnouncement=false";
  static String getAllSnake = "${baseUrl}concessions?limit=100&offset=0&vistaCinemaId=0000000011";
}