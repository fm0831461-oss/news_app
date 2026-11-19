import 'package:flutter/material.dart';
import 'package:news_app/NewApp1/Providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomField extends StatelessWidget {
  String label;
  IconData prefixIcon;
  Widget sufixIcon;
  TextEditingController controller;
  bool isPass;
  bool obscure;
  CustomField({
    required this.label,
    required this.controller,
    required this.prefixIcon,
    required this.sufixIcon,

    required this.isPass,
    this.obscure = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please fill data";
        } else if (label == "Name" && value.length < 3) {
          return "Name must be at least 3 characters";
        } else if (label == "Email" && !value.contains("@gmail.com")) {
          return "Enter a valid Email";
        } else if (label == "Password" && value.length < 8) {
          return "Password must be more than 8 characters";
        }
        return null;
      },
      obscureText: isPass ? context.watch<AuthProvider>().isPass : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: sufixIcon,
      ),
    );
  }
}
