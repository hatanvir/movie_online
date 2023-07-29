import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'interceptors/network_cennection_interceptor.dart';

class BaseApiProvider {
  late DioClient _dioClient;

  BaseApiProvider() {
    var dio = Dio();
    _dioClient = DioClient(dio,interceptors: [NetworkConnectionInterceptor()]);
  }

  Dio get dio => _dioClient.clientDio!;
}
