import 'package:flutter/material.dart';
import 'package:news_app/NewApp1/Providers/auth_provider.dart';
import 'package:news_app/NewApp1/Screens/home_screen.dart';
import 'package:news_app/NewApp1/Widgets/custom_text_feild.dart';
import 'package:provider/provider.dart';

class LoginScreens extends StatelessWidget {
  LoginScreens({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final providerObject = context.read<AuthProvider>();
    final providerObject = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontWeight: .bold,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            CustomField(
              label: "Email",
              prefixIcon: Icons.email,
              sufixIcon: Icon(Icons.email),
              controller: email,
              isPass: false,
            ),
            CustomField(
              label: "Password",
              prefixIcon: Icons.lock,
              controller: password,
              isPass: false,
              sufixIcon: IconButton(
                onPressed: providerObject.togleVisiability,
                icon: Icon(
                  providerObject.isPass
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final success = await providerObject.userLogin(
                    email: email.text,
                    password: password.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        providerObject.auth?.message ?? 'Please try again',
                      ),
                      backgroundColor: success
                          ? Colors.green
                          : Colors.deepOrange,
                    ),
                  );

                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
