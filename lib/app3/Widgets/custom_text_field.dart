// import 'package:flutter/material.dart';
// import 'package:news_app/app3/Providers/auth_provider_3.dart';
// import 'package:provider/provider.dart';

// class CustomTextField extends StatelessWidget {
//   String label;
//   TextEditingController controller;
//   IconData prefixIcon;
//   Widget sufixIcon;
//   bool isPool;
//   bool Obsucure;

//   CustomTextField({
//     super.key,
//     this.Obsucure = false,
//     required this.controller,
//     required this.isPool,
//     required this.label,
//     required this.prefixIcon,
//     required this.sufixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final objectProvider = context.watch<AuthProvider3>();
//     return Card(
//       elevation: 10,
//       child: SingleChildScrollView(
//         child: TextFormField(
//           controller: controller,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please fill data";
//             } else if (label == "Name" && value.length < 3) {
//               return "Name must be at least 3 characters";
//             } else if (label == "Password" && value.length < 8) {
//               return "Password must be at least 8 characters";
//             } else if (label == "Email" && !value.contains("@gmail.com")) {
//               return "Enter a valid Email";
//             }
//             return null;
//           },
//           obscureText: Obsucure,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//             labelText: label,
//             prefixIcon: Icon(prefixIcon),
//             suffixIcon: sufixIcon,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  bool isPass;
  bool obscure;
  IconData prefixIcon;
  Widget sufixIcon;
  TextEditingController controller;
  CustomTextField({
    super.key,
    required this.controller,
    required this.isPass,
    required this.label,
    required this.sufixIcon,
    required this.prefixIcon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "PLS fill data";
        } else if (label == "Name" && value.length < 3) {
          return "PLS name must be more than 3 char";
        } else if (label == "Password" && value.length < 8) {
          return "PLS password must be more than  char";
        } else if (label == "Email" && !value.contains("@gmail.com")) {
          return "Email In Valid";
        }
        return null;
      },
      obscureText: obscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: sufixIcon,
      ),
    );
  }
}
