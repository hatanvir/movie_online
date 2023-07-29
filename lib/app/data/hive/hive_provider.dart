import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:movie_online/app/core/base/general_response.dart';

import '../models/movie_response.dart';

class HiveProvider {
  var movieBox;

  getMovieBox() async {
   return movieBox ??= await Hive.openBox('movieBox');
  }

  Future setMovieJson({required String movieJson}) async {
    var box = await getMovieBox();
    await box.put('movieJson', movieJson);
  }

  Future<GeneralResponse> getMovies() async{
    var box = await getMovieBox();
    String json =  await box.get('movieJson');
    return GeneralResponse(statusCode: 200,data: movieResponseFromJson(jsonDecode(json)));
  }
}
