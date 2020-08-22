import 'package:fav_food/meal_item.dart';
import 'package:fav_food/modals/mealsSpecs.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatefulWidget {
  List<MealsSpecs> mealsToShow;
  MealsScreen(this.mealsToShow);
  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  var loadedData = false;

  List<MealsSpecs> categoryMeals;

  String categoryTitle;
  @override
  Widget build(BuildContext context) {
    if (!loadedData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.mealsToShow.where((mealsSpecs) {
        return mealsSpecs.categories.contains(categoryId);
      }).toList();
      loadedData = true;
    }
    // void removeMeal(String mealId) {
    //   setState(() {
    //     categoryMeals.removeWhere((meals) => meals.id == mealId);
    //   });
    // }

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
