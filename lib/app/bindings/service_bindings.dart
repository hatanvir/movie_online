import 'package:movie_online/app/data/services/movie_service.dart';
import 'package:get/get.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    ///services
    Get.lazyPut<MovieService>(
            () => MovieService(),
        fenix: true
    );

   }
}