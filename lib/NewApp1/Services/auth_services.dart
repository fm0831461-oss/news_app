import 'package:dio/dio.dart';
import 'package:news_app/NewApp1/Models/auth-model.dart';

class AuthServices {
  static Dio dio = Dio();
  static Future<AuthModel> login({
    required String password,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return AuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception(("Other Error ${other.toString()}"));
    }
  }

  static Future<AuthModel> sign({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Email": email,
          "Password": password,
          "Phone": phone,
          "Name": name,
        },
      );
      return AuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception(("Other Error ${other.toString()}"));
    }
  }
}
