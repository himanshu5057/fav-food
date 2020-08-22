import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../category_items.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
          padding: EdgeInsets.all(10),
          children: DUMMY_CATEGORIES
              .map((func) => Items(func.title, func.clr, func.id))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        );
  }
}
