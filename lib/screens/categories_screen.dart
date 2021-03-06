import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                color: category.color,
                title: category.title,
                id: category.id,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 /
            2, // This indicates what is the height vs width ratio of the items in the grid
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
