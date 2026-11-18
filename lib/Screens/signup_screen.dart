import 'package:flutter/material.dart';
import 'package:news_app/Providers/auth_provider.dart';
import 'package:news_app/Screens/login_screen.dart';
import 'package:news_app/Widgets/custom_text_feild.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final ckey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final phoneController = TextEditingController();
  // final VoidCallback onPress;
  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final logProvider = context.read<AuthProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Sign Up"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: ckey,
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 50, fontWeight: .bold),
                ),
                SizedBox(height: 5),

                Text("Create your Account", style: TextStyle(fontSize: 15)),
                SizedBox(height: 20),

                CustomTextFeild(
                  controller: userController,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "PLS enter your UserName";
                    }
                    return null;
                  },
                  hintText: "UserName",
                  prefixIcon: Icons.person,
                  isPass: false,
                ),
                SizedBox(height: 20),
                CustomTextFeild(
                  controller: logProvider.emailController,
                  validate: logProvider.validatoremail,
                  hintText: "Email",

                  prefixIcon: Icons.email,
                  isPass: false,
                ),
                SizedBox(height: 20),
                CustomTextFeild(
                  controller: logProvider.passController,
                  validate: logProvider.validatorpass,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isPass: true,
                ),
                SizedBox(height: 20),
                CustomTextFeild(
                  controller: phoneController,
                  hintText: "PhonePassword",
                  prefixIcon: Icons.phone,
                  isPass: false,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "PLS enater Data";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),

                SizedBox(height: 5),

                Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 160, 20, 151),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () async {
                      if (ckey.currentState!.validate()) {
                        await logProvider.SignUp(
                          email: logProvider.emailController.text,
                          password: logProvider.passController.text,
                          name: userController.text,
                          phone: phoneController.text,
                        );
                        // await logProvider.SignUp(email: email, password: password, name: name, phone: phone)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${logProvider.auth!.message}"),
                          ),
                        );
                        if (logProvider.auth!.status == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),

                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    " Already an aaccount Login",
                    style: TextStyle(
                      fontWeight: .bold,
                      color: const Color.fromARGB(255, 238, 150, 150),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
