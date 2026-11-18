import 'package:flutter/material.dart';
import 'package:news_app/Providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validate;
  final String hintText;
  final bool isPass;
  final IconData prefixIcon;
  const CustomTextFeild({
    super.key,
    required this.controller,
    required this.validate,
    required this.hintText,
    required this.isPass,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<AuthProvider>();
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: isPass && !logProvider.isPass,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: isPass
            ? IconButton(
                onPressed: logProvider.togleVisiability,
                icon: Icon(
                  logProvider.isPass ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
