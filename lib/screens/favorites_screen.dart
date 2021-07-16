import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/recipe_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> _favoriteRecipes;

  const FavoritesScreen(this._favoriteRecipes);

  @override
  Widget build(BuildContext context) {
    if(_favoriteRecipes.isEmpty) {
      return Center(
        child: Text("Favorites Screen!"),
      );
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return RecipeItem(
              complexity: _favoriteRecipes[index].complexity,
              affordability: _favoriteRecipes[index].affordability,
              title: _favoriteRecipes[index].title,
              prepTime: _favoriteRecipes[index].prepTime,
              imageUrl: _favoriteRecipes[index].imageUrl,
              id: _favoriteRecipes[index].id,
            );
          },
          itemCount: _favoriteRecipes.length,
        ),
      );
    }
  }
}
