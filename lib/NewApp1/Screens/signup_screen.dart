import 'package:flutter/material.dart';
import 'package:news_app/NewApp1/Providers/auth_provider.dart';
import 'package:news_app/NewApp1/Screens/login_screen.dart';
import 'package:news_app/NewApp1/Widgets/custom_text_feild.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final providerObject = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 45),

            CustomField(
              label: "Name",
              prefixIcon: Icons.person,
              sufixIcon: Icon(Icons.person),
              controller: name,
              isPass: false,
            ),
            SizedBox(height: 15),

            CustomField(
              label: "Phone",
              prefixIcon: Icons.phone,
              sufixIcon: Icon(Icons.phone),
              controller: phone,
              isPass: false,
            ),
            SizedBox(height: 15),

            CustomField(
              label: "Email",
              prefixIcon: Icons.email,
              sufixIcon: Icon(Icons.email),
              controller: email,
              isPass: false,
            ),
            SizedBox(height: 15),
            CustomField(
              label: "Password",
              prefixIcon: Icons.lock,
              sufixIcon: IconButton(
                onPressed: providerObject.togleVisiability,
                icon: Icon(
                  providerObject.isPass
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
              controller: password,
              obscure: true,
              isPass: true,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                final success = await providerObject.signUp(
                  name: name.text,
                  email: email.text,
                  phone: phone.text,
                  password: password.text,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      providerObject.auth?.message ?? 'Please try again',
                    ),
                    backgroundColor: success ? Colors.green : Colors.deepOrange,
                  ),
                );

                if (success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreens()),
                  );
                }
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
