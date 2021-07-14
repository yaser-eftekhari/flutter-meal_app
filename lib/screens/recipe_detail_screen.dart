import 'package:flutter/material.dart';

import '../dummy_data.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = "/recipe-detail";

  RecipeDetailScreen() {}

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final recipeId = routeArgs['id'];
    final recipeTitle = routeArgs['title'];

    final selectedRecipe =
        DUMMY_RECIPES.firstWhere((recipe) => recipe.id == recipeId);

    Widget buildSectionTitle(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer({required Widget child}) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: 300,
          height: 150,
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedRecipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedRecipe.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 5,
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedRecipe.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedRecipe.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(selectedRecipe.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
