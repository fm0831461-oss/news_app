import 'package:dio/dio.dart';
import 'package:news_app/app3/Models/auth_model_3.dart';

class AuthServices3 {
  static Dio dio = Dio();
  static Future<AuthModel3> login({
    required String password,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Password": password, "Email": email},
      );
      return AuthModel3.fromjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error ${other.toString()}");
    }
  }

  static Future<AuthModel3> signUp({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Name": name,
          "Password": password,
          "Email": email,
          "Phone": phone,
        },
      );
      return AuthModel3.fromjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error${other.toString()}");
    }
  }
}
