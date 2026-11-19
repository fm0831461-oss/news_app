import 'package:flutter/material.dart';
import 'package:news_app/NewsApp2/Models/auth_model_p2.dart';
import 'package:news_app/NewsApp2/Providers/auth_provider_p2.dart';
import 'package:provider/provider.dart';

class CustomFormField extends StatelessWidget {
  String label;
  IconData prefixIcon;
  Widget sufixIcon;
  TextEditingController controller;
  bool isPass;
  bool obscure;
  CustomFormField({
    super.key,
    required this.controller,
    required this.isPass,
    required this.label,
    this.obscure = false,
    required this.prefixIcon,
    required this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "PLSfill data";
        } else if (label == "Name" && value.length < 3) {
          return "name must be at least 3 char";
        } else if (label == "Email" && !value.contains("@gmail.com")) {
          return "Enter valid email ";
        } else if (label == "Password" && value.length < 8) {
          return "password must be at least 8 char";
        }
        return null;
      },
      obscureText: isPass ? context.watch<AuthProviderP2>().isPass : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: sufixIcon,
      ),
    );
  }
}
