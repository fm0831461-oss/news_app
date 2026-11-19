import 'package:flutter/material.dart';
import 'package:news_app/NewApp1/Models/artical_model.dart';
import 'package:news_app/NewApp1/Screens/details_screen.dart';

class CustomHome extends StatelessWidget {
  final ArticalModel aetical;
  const CustomHome({super.key, required this.aetical});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen()),
      ),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              aetical.imgeUrl,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image),
            ),
            Text(aetical.title),
            Text(aetical.description),
          ],
        ),
      ),
    );
  }
}
