import 'package:flutter/material.dart';
import 'package:news_app/NewApp1/Providers/auth_provider.dart';
import 'package:news_app/NewApp1/Providers/home_provider.dart';
// import 'package:news_app/NewApp1/Screens/signup_screen.dart';
import 'package:news_app/NewsApp2/Providers/auth_provider_p2.dart';
import 'package:news_app/NewsApp2/Screens/sign_up_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AuthProviderP2()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SignUpScreen(),
      ),
    );
  }
}
