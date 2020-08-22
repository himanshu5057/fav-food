import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            height: 120,
            width: double.infinity,
            child: Center(
              child: Text(
                "Cooking Up!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 26,
              ),
              title: Text(
                'Meals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            onTap: () {Navigator.of(context).pushReplacementNamed('/filters-screen');},
          ),
        ],
      ),
    );
  }
}
