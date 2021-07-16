import 'package:flutter/material.dart';

import '../widgets/recipe_item.dart';
import '../dummy_data.dart';

import '../models/recipe.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meal";

  CategoryMealsScreen();

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String title;
  late List<Recipe> categoryMeals;
  var isInit = false;

  @override
  // have to use this instead of initState because we need context which is not available in initState method
  void didChangeDependencies() {
    if (!isInit) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      title = routeArgs['title']!;
      final categoryId = routeArgs['id'];

      categoryMeals = DUMMY_RECIPES.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      isInit = true;
    }
    super.didChangeDependencies();
  }

  void _removeRecipe(String recipeId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == recipeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return RecipeItem(
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              title: categoryMeals[index].title,
              prepTime: categoryMeals[index].prepTime,
              imageUrl: categoryMeals[index].imageUrl,
              id: categoryMeals[index].id,
              removeRecipe: _removeRecipe,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
