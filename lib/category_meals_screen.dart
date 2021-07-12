import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String title;

  CategoryMealsScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Recipes for $title"),
      ),
      body: Center(
        child: Text("Recipe for this category!"),
      ),
    );
  }
}
