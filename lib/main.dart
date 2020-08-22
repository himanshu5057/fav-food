import 'package:fav_food/dummy_data.dart';
import 'package:fav_food/screens/filters_screen.dart';

import './screens/tab_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/meals_screen.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';
import './modals/mealsSpecs.dart';

void main() {
  runApp(MainClass());
}

class MainClass extends StatefulWidget {
  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false
  };
  List<MealsSpecs> favouriteMeals=[];
  List<MealsSpecs> mealsToShow=DUMMY_MEALS;
  void filtersData(Map<String, bool> data) {
    setState(() {
      filters = data;
      mealsToShow = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  void toggleScreen(String mealId){
    final index=favouriteMeals.indexWhere((meal){
      return
      meal.id==mealId;
    });
    if(index>=0)
    setState(() {
    favouriteMeals.removeAt(index);  
    });
    else{
      setState(() {
        favouriteMeals.add(mealsToShow.firstWhere((meal)=> meal.id==mealId));
      });
    }
  }
    bool favourites(String id){
      return(favouriteMeals.any((meal)=>meal.id==id));
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.amber,
        // fontFamily: 'Oswald',
      ),
      title: 'Food',
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favouriteMeals),
        '/categories-meals': (ctx) => MealsScreen(mealsToShow),
        '/meal-detail-screen': (ctx) => MealDetailScreen(toggleScreen,favourites),
        '/filters-screen': (ctx) => FiltersScreen(filters, filtersData)
      },
    );
  }
}
