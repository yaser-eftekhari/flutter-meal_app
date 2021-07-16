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

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      
      _availableRecipe = DUMMY_RECIPES.where((recipe) {
        if(_filters["vegetarian"]! && !recipe.isVegetarian)
          return false;
        if(_filters["vegan"]! && !recipe.isVegan)
          return false;
        if(_filters["lactose"]! && !recipe.isLactoseFree)
          return false;
        if(_filters["gluten"]! && !recipe.isGlutenFree)
          return false;

        return  true;
      }).toList();
    });
  }

  List<Recipe> _availableRecipe = DUMMY_RECIPES;

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
        "/" : (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableRecipe),
        RecipeDetailScreen.routeName : (ctx) => RecipeDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // onGenerateRoute: ,
    );
  }
}
