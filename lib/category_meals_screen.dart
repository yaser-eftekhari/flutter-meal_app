import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meal";

  CategoryMealsScreen();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_RECIPES.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
