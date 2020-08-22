import 'package:fav_food/modals/mealsSpecs.dart';

import '../screens/main_drawer.dart';
import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import 'fav_screen.dart';

class TabScreen extends StatefulWidget {
  List<MealsSpecs> favMeals;
  TabScreen(this.favMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> pages; 
  int pageIndex = 0;
  selectPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }
  @override
  void initState() {
    pages=[
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavScreen(widget.favMeals), 'title': 'Favourites'}
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(pages[pageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.red,
          onTap: selectPage,
          currentIndex: pageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: Text("Categories"),
                backgroundColor: Colors.red[300]),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text("Favourites"),
                backgroundColor: Colors.lime[300])
          ]),
    );
  }
}
