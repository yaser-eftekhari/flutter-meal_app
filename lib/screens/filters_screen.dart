import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function _saveFilters;
  final Map<String, bool> _filterSetting;

  FiltersScreen(this._saveFilters, this._filterSetting);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget._filterSetting["gluten"]!;
    _vegetarian = widget._filterSetting["vegetarian"]!;
    _vegan = widget._filterSetting["vegan"]!;
    _lactoseFree = widget._filterSetting["lactose"]!;
    super.initState();
  }

  Widget _buildSwitchListTile({
    required String title,
    required String description,
    required bool value,
    required Function(bool) applyChange,
  }) {
    return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(description),
        onChanged: applyChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(onPressed: () => widget._saveFilters({
            "gluten": _glutenFree,
            "vegan": _vegan,
            "vegetarian": _vegetarian,
            "lactose": _lactoseFree,
          }), icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust recipe selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    title: "Gluten Free",
                    description: "Only include gluten free",
                    value: _glutenFree,
                    applyChange: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: "Lactose Free",
                    description: "Only include lactose free",
                    value: _lactoseFree,
                    applyChange: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: "Vegetarian",
                    description: "Only include vegetarian",
                    value: _vegetarian,
                    applyChange: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: "Vegan",
                    description: "Only include vegan",
                    value: _vegan,
                    applyChange: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
