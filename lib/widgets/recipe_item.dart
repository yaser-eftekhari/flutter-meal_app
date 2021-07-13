import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int prepTime;

  RecipeItem({
    required this.complexity,
    required this.affordability,
    required this.title,
    required this.prepTime,
    required this.imageUrl,
  });

  void selectRecipe() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectRecipe,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
