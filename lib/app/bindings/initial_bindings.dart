
import 'package:movie_online/app/bindings/repository_bindings.dart';
import 'package:movie_online/app/bindings/service_bindings.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/data/hive/hive_provider.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {

    ServiceBindings().dependencies();
    RepositoryBindings().dependencies();

    ///hive binding
    Get.put(HiveProvider());

  }
}