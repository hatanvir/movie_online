import 'package:get/get.dart';

import '../modules/movie/bindings/movie_binding.dart';
import '../modules/movie/views/movie_view.dart';
import '../modules/movie_details/bindings/movie_details_binding.dart';
import '../modules/movie_details/views/movie_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MOVIES;

  static final routes = [
    GetPage(
      name: _Paths.MOVIES,
      page: () => MovieView(),
      binding: MovieBinding(),
    ),
   GetPage(
      name: _Paths.MOVIE_DETAILS,
      page: () => MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
  ];
}
