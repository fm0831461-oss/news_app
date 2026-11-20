import 'package:flutter/material.dart';
import 'package:news_app/NewsApp2/Providers/auth_provider_p2.dart';
import 'package:news_app/NewsApp2/Screens/home_screen.dart';
import 'package:news_app/NewsApp2/Widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> ckey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<AuthProviderP2>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "Login Page",
            style: TextStyle(fontWeight: .bold, fontSize: 20),
          ),
        ),
        body: Form(
          key: ckey,
          child: Column(
            children: [
              Text("Login", style: TextStyle(fontWeight: .bold, fontSize: 20)),
              SizedBox(height: 20),
              CustomFormField(
                controller: email,
                isPass: false,
                label: "Email",
                prefixIcon: Icons.email,
                sufixIcon: Icon(Icons.email),
              ),

              CustomFormField(
                controller: password,
                isPass: true,
                label: "Password",
                prefixIcon: Icons.lock,
                sufixIcon: IconButton(
                  onPressed: logProvider.togleVisiability,
                  icon: Icon(
                    logProvider.isPass
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (ckey.currentState!.validate()) {
                    final success = await logProvider.login(
                      email: email.text,
                      password: password.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          logProvider.auth?.message ?? "PLS try again",
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
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
