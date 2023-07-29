import 'package:get/get.dart';
import 'package:movie_online/app/data/models/movie_response.dart';

class MovieDetailsController extends GetxController {

  Movies? movies;
  @override
  void onInit() {
    super.onInit();
    movies = Get.arguments['movie'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
