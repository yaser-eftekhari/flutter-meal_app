import 'package:flutter/material.dart';
import '../models/recipe.dart';

import 'favorites_screen.dart';
import 'categories_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Recipe> _favoriteRecipes;

  TabsScreen(this._favoriteRecipes);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;

  @override
  initState() {
    _pages = [
      {
        "page": CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": FavoritesScreen(widget._favoriteRecipes),
        "title": "Favorites",
      },
    ];
  }

  int _selectedPageIndex = 0;

  void _pageSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"].toString()),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _pageSelected,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}
