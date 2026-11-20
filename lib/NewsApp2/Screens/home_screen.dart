import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
