// import 'package:flutter/material.dart';
// import 'package:news_app/app3/Models/auth_model_3.dart';
// import 'package:news_app/app3/Services/auth_services_3.dart';

// class AuthProvider3 extends ChangeNotifier {
//   AuthModel3? auth;
//   bool isPass = true;
//   Future<bool> login({required String password, required String email}) async {
//     final response = await AuthServices3.login(
//       email: email,
//       password: password,
//     );
//     auth = response;
//     return response.status;
//   }

//   Future<bool> sign({
//     required String password,
//     required String phone,
//     required String name,
//     required String email,
//   }) async {
//     final response = await AuthServices3.signUp(
//       email: email,
//       password: password,
//       phone: phone,
//       name: name,
//     );
//     auth = response;
//     return response.status;
//   }

//   void togleVisiability() {
//     isPass = !isPass;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:news_app/app3/Models/auth_model_3.dart';
import 'package:news_app/app3/Services/auth_services_3.dart';

class AuthProvider3 extends ChangeNotifier {
  AuthModel3? auth;
  bool isPass = true;
  Future<bool> login({required String password, required String email}) async {
    final response = await AuthServices3.login(
      password: password,
      email: email,
    );
    auth = response;
    return response.status;
  }

  Future<bool> signUp({
    required String password,
    required String email,
    required String name,
    required String phone,
  }) async {
    final response = await AuthServices3.signUp(
      name: name,
      password: password,
      email: email,
      phone: phone,
    );

    auth = response;
    return response.status;
  }
}
