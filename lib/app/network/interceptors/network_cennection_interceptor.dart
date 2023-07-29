
import 'package:dio/dio.dart' as dio;
import 'package:movie_online/app/core/widgets/custom_toast.dart';
import 'package:movie_online/app/network/check_network_conn.dart';
import 'package:get/get.dart';

class NetworkConnectionInterceptor implements dio.InterceptorsWrapper{
  @override
  void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  Future<void> onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    if(!await CheckNetwork.checkNetwork.check()){
      return  handler.reject(NetworkConnException());
    }
    return handler.next(options);
  }

  @override
  void onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}

class NetworkConnException implements dio.DioError{

  @override
  late dio.RequestOptions requestOptions;

  @override
  dio.Response? response;

  @override
  StackTrace? stackTrace;

  @override
  dio.DioErrorType type = dio.DioErrorType.cancel;

  @override
  var error;

  @override
  String get message => throw UnimplementedError();

}