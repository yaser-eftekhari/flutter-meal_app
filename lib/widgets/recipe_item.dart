import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../screens/recipe_detail_screen.dart';

class RecipeItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int prepTime;

  RecipeItem({
    required this.id,
    required this.complexity,
    required this.affordability,
    required this.title,
    required this.prepTime,
    required this.imageUrl,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Simple";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  void selectRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(
      RecipeDetailScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
      // then is called when the page is not needed anymore which is when the page has popped back.
      // the value is whatever has been passed from the other page in the pop method.
    ).then((value) {
      // if(value != null) // if pop was used instead of back button
        // removeRecipe(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectRecipe(context),
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
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$prepTime min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
