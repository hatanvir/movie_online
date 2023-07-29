import 'package:movie_online/app/core/base/general_response.dart';
import 'package:movie_online/app/data/hive/hive_provider.dart';
import 'package:movie_online/app/data/services/movie_service.dart';
import 'package:get/get.dart';

class MovieRepo{
  MovieService issueService = Get.find();
  HiveProvider hiveProvider = Get.find();

  Future<GeneralResponse> getMovies() async {
    return issueService.getIssueByPage();
  }

  Future<GeneralResponse> getMoviesFromHive() async {
    return hiveProvider.getMovies();
  }

  Future saveMoviesToHive(String movieJson) async {
    hiveProvider.setMovieJson(movieJson: movieJson);
  }

}