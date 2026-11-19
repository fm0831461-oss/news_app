import 'package:dio/dio.dart';
import 'package:news_app/NewsApp2/Models/auth_model_p2.dart';

class AuthServicesP2 {
  static Dio dio = Dio();
  static Future<AuthModelP2> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Password": password, "Email": email},
      );
      return AuthModelP2.fromjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error${other.toString()}");
    }
  }
}
