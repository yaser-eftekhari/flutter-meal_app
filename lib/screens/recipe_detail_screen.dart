import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = "/recipe-detail";

  RecipeDetailScreen() {}

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final recipeId = routeArgs['id'];
    final recipeTitle = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle!),
      ),
      body: Center(
        child: Text("Detail Recipe - $recipeId"),
      ),
    );
  }
}
