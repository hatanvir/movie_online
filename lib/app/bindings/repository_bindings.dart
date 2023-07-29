
import 'package:movie_online/app/data/repository/movie_repo.dart';
import 'package:get/get.dart';

class RepositoryBindings extends Bindings {
  @override
  void dependencies() {
    ///repositories
    Get.lazyPut<MovieRepo>(
            () => MovieRepo(),
        fenix: true
    );
  }
}