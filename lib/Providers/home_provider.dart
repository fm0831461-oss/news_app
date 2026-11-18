import 'package:flutter/material.dart';
import 'package:news_app/Models/artical_model.dart';
import 'package:news_app/Services/home_services.dart';

class HomeProvider extends ChangeNotifier {
  Articles? dataModel;
  Future<void> getNews() async {
    dataModel = await HomeServices.fetchData();
    notifyListeners();
  }
}
