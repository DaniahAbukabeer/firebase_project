//a screen that showsa all the meals for a selected category

import 'package:firebase_project/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/models/meal.dart';
import 'package:firebase_project/widgets/meal_item.dart';
import 'package:firebase_project/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  void _onSelectMealDetails(BuildContext context, Meal meal) {
    // final Meal specifecMeal =
    // dummyMeals.where((meal1) => meal1.id.contains(meal.id));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh .. nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMealDetails: (meal) {
            _onSelectMealDetails(context, meal);
          },
        ),
      );
    }

    // Text(
    //       meals[index].title,
    //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
    //             color: Theme.of(context).colorScheme.onBackground,
    //           ),
    //     ),

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
