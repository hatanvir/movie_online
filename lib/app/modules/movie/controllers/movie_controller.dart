import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movie_online/app/core/base/general_response.dart';
import 'package:movie_online/app/core/widgets/custom_toast.dart';
import 'package:movie_online/app/data/hive/hive_provider.dart';
import 'package:movie_online/app/data/models/movie_response.dart';
import 'package:movie_online/app/data/repository/movie_repo.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  MovieRepo movieRepo = Get.find();

  ScrollController scrollController = ScrollController();
  var movieList = <Movies>[].obs;
  var movieTypeList = <String>[].obs;
  var movieListTemp = <Movies>[].obs;
  var page = 1.obs;

  var isLoadingData = false.obs;

  var selectedMovieType = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getMovieList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///getting issue list here
  void getMovieList() async {
    isLoadingData.value = true;

    GeneralResponse generalResponse = await movieRepo.getMovies();
    if (generalResponse.statusCode == 200) {
      await movieRepo.saveMoviesToHive(generalResponse.data);
    } else {
      showToast(msg: generalResponse.data, isError: true);
    }

    await getMovieFromHive();

    isLoadingData.value = false;
  }

  Future getMovieFromHive() async {
    GeneralResponse generalResponse = await movieRepo.getMoviesFromHive();
    MovieResponse movieResponse = generalResponse.data;

    movieList.addAll(movieResponse.movies);
    movieTypeList.addAll(movieResponse.genres);

    selectedMovieType.value = movieTypeList[0];

    getMovieByType();
  }

  void getMovieByType() {
    movieListTemp.value = movieList.where((element) => element.genres.contains(selectedMovieType.value)).toList();
  }
}
