import 'package:fav_food/modals/mealsSpecs.dart';
import 'package:flutter/material.dart';

import '../meal_item.dart';
class FavScreen extends StatefulWidget {
  List<MealsSpecs> favMeals;
  FavScreen(this.favMeals);
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favMeals.isEmpty){
      return Scaffold(
      body: Center(child: Text("No Favourites"),),
    );
    }
    else{
      return  ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favMeals[index].id,
              imageUrl: widget.favMeals[index].imageUrl,
              title: widget.favMeals[index].title,
              duration: widget.favMeals[index].duration,
              affordability: widget.favMeals[index].affordability,
              complexity: widget.favMeals[index].complexity,
            );
          }, 
          itemCount: widget.favMeals.length,
        );
    }
    
  }
}