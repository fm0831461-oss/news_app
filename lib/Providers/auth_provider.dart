import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/auth-model.dart';
import 'package:news_app/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? auth;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isPass = true;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    auth = await AuthServices.Login(password: password, email: password);
  }

  Future<void> SignUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    auth = await AuthServices.Sign(
      password: password,
      email: password,
      name: name,
      phone: phone,
    );
  }

  void togleVisiability() {
    isPass = !isPass;
    notifyListeners();
  }

  String? validatorpass(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "PLS enter your password";
    }
    return null;
  }

  String? validatoremail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "PLS enter your email";
    }
    return null;
  }
}
