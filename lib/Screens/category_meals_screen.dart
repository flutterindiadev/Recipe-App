import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../Models/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String categotyId;
  // final String categotyTitle;

  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    // receive id and title inside build method using routeArgs
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    //extract the arguments here

    var categoryTitle = routeArgs['title'];
    var categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability);
        },
      ),
    );
  }
}
