import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'models/recipe.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';

// import 'screens/tab_bar_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false,
  };

  List<Recipe> _availableRecipe = DUMMY_RECIPES;
  List<Recipe> _favoriteRecipe = [];

  void _handleFavorites(String recipeId) {
    final index =
        _favoriteRecipe.indexWhere((element) => element.id == recipeId);

    // need to add the recipe to the list
    if (index == -1) {
      setState(() {
        _favoriteRecipe.add(
            _availableRecipe.firstWhere((element) => element.id == recipeId));
      });
    } else {
      // remove from the list
      setState(() {
        _favoriteRecipe.removeAt(index);
      });
    }
  }

  bool _isFavorite(String recipeId) {
    return _favoriteRecipe.any((element) => element.id == recipeId);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableRecipe = DUMMY_RECIPES.where((recipe) {
        if (_filters["vegetarian"]! && !recipe.isVegetarian) return false;
        if (_filters["vegan"]! && !recipe.isVegan) return false;
        if (_filters["lactose"]! && !recipe.isLactoseFree) return false;
        if (_filters["gluten"]! && !recipe.isGlutenFree) return false;

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: TabsScreen(),
      // home: CategoriesScreen(),
      // home: TabsScreen(),
      routes: {
        "/": (ctx) => TabsScreen(_favoriteRecipe),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableRecipe),
        RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(_handleFavorites, _isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // onGenerateRoute: ,
    );
  }
}
