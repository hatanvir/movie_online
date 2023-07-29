
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movie_online/app/core/base/general_response.dart';
import 'package:movie_online/app/data/models/movie_response.dart';
import 'package:movie_online/app/network/apis.dart';
import 'package:movie_online/app/network/base_api_provider.dart';
import 'package:movie_online/app/network/dio_exception.dart';

class MovieService extends BaseApiProvider{
  Future<GeneralResponse> getIssueByPage() async {
    try{
      var request = await dio.get(Apis.getMovieList);
      if(request.statusCode == 200){
        if (kDebugMode) {
          print(request.data);
        }
        return GeneralResponse(statusCode: 200,data: jsonEncode(request.data));
      }
      return GeneralResponse(statusCode: request.statusCode!,data: request.data);
    }catch(e){
      return GeneralResponse(statusCode: 400,data: DioException.getDioException(e));
    }
  }

}