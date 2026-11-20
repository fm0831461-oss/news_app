import 'package:flutter/material.dart';
import 'package:news_app/NewsApp2/Models/auth_model_p2.dart';
import 'package:news_app/NewsApp2/Services/auth_services_p2.dart';

class AuthProviderP2 extends ChangeNotifier {
  AuthModelP2? auth;

  bool isPass = true;
  Future<bool> login({required String email, required String password}) async {
    final response = await AuthServicesP2.login(
      email: email,
      password: password,
    );
    auth = response;
    return response.status;
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    final response = await AuthServicesP2.sign(
      email: email,
      password: password,
      phone: phone,
      name: name,
    );
    auth = response;
    return response.status;
  }

  void togleVisiability() {
    isPass = !isPass;
    notifyListeners();
  }
}
