import 'package:flutter/material.dart';
import 'package:news_app/NewsApp2/Providers/auth_provider_p2.dart';
import 'package:news_app/NewsApp2/Screens/login_screen.dart';
import 'package:news_app/NewsApp2/Widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> ckey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final objectProvider = context.watch<AuthProviderP2>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "SignUp Page",
            style: TextStyle(fontWeight: .bold, fontSize: 20),
          ),
        ),
        body: Form(
          key: ckey,
          child: Column(
            children: [
              Text("SignUp", style: TextStyle(fontWeight: .bold, fontSize: 20)),
              SizedBox(height: 20),
              CustomFormField(
                controller: name,
                isPass: false,
                label: "Name",
                prefixIcon: Icons.person,
                sufixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10),

              CustomFormField(
                controller: email,
                isPass: false,
                label: "Email",
                prefixIcon: Icons.email,
                sufixIcon: Icon(Icons.email_outlined),
              ),
              SizedBox(height: 10),

              CustomFormField(
                controller: password,
                isPass: true,
                label: "Password",
                prefixIcon: Icons.lock,
                sufixIcon: IconButton(
                  onPressed: objectProvider.togleVisiability,
                  icon: Icon(
                    objectProvider.isPass
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              CustomFormField(
                controller: phone,
                isPass: false,
                label: "Phone",
                prefixIcon: Icons.phone,
                sufixIcon: Icon(Icons.phone),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (!ckey.currentState!.validate()) return;

                  final success = await objectProvider.signUp(
                    email: email.text.trim(),
                    password: password.text,
                    phone: phone.text.trim(),
                    name: name.text.trim(),
                  );

                  print("Success: $success");

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        objectProvider.auth?.message ?? 'Please try again',
                      ),
                    ),
                  );

                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
                child: Text("SignUp"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
