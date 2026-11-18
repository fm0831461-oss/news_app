import 'package:dio/dio.dart';
import 'package:news_app/Models/artical_model.dart';

class HomeServices {
  static Dio dio = Dio();
  static Future<Articles> fetchData() async {
    Response response = await dio.get("");
    return Articles.fromjson(response.data);
  }
}
