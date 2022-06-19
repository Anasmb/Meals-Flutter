import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/categories-meals";
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs["id"];
    final String categoryTitle = routeArgs["title"];
    final categoryMeals = DUMMY_MEALS.where(((element) {
      return element.categories.contains(categoryId);
    })).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordabilty: categoryMeals[index].affordabilty,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration);
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
