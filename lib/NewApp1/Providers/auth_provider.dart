import 'package:flutter/material.dart';
import 'package:news_app/NewApp1/Models/auth-model.dart';
import 'package:news_app/NewApp1/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? auth;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isPass = true;
  Future<bool> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await AuthServices.login(email: email, password: password);
    auth = response;
    return response.status;
  }

  Future<bool> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await AuthServices.sign(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    auth = response;
    return response.status;
  }

  void togleVisiability() {
    isPass = !isPass;
    notifyListeners();
  }
}
