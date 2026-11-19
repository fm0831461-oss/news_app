import 'package:flutter/material.dart';
import 'package:news_app/NewApp1/Providers/home_provider.dart';
import 'package:news_app/NewApp1/Widgets/custom_home.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          final data = value.dataModel?.articles;
          if (data == null) {
            value.getNews();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => CustomHome(aetical: data[index]),
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
