import 'package:dio/dio.dart';
import 'package:news_app/NewApp1/Models/artical_model.dart';

class HomeServices {
  static Dio dio = Dio();
  static Future<Articles> fetchData() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a410b1724f84452c8df8a810efe34642",
      );
      return Articles.fromjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("Other Error:${other.toString()}");
    }
  }
}
