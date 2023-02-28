import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../provider/meal_provider.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Meal> favMeal =
        Provider.of<MealProvider>(context, listen: true).favoriteMeals;
    if (favMeal.isEmpty) {
      return const Center(
        child: Text("No Favs Selected"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeal[index].id,
            imgUrl: favMeal[index].imageUrl,
            title: favMeal[index].title,
            affordability: favMeal[index].affordability,
            complexity: favMeal[index].complexity,
            duration: favMeal[index].duration,
          );
        },
        itemCount: favMeal.length,
      );
    }
    return const Center(
      child: null,
    );
  }
}
