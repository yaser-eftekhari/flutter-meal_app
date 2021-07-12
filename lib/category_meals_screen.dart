import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  CategoryMealsScreen();

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Text("Recipe for this category!"),
      ),
    );
  }
}
