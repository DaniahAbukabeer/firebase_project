import 'package:firebase_project/data/dummy_data.dart';
import 'package:firebase_project/screens/meals.dart';
import 'package:firebase_project/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/models/category.dart';
import 'package:firebase_project/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFav});

  final void Function(Meal meal) onToggleFav;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMealas = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMealas,
          onToggleFav: onToggleFav,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final categroy in availableCategories)
            CategoryGridItem(
              category: categroy,
              onSelectGategory: () {
                _selectCategory(context, categroy);
              },
            )
        ],
      ),
    );
  }
}
