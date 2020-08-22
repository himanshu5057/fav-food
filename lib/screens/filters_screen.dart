import 'package:fav_food/screens/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  Function saveState;
  Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.saveState);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool gluttenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  Map<String, bool> selectedFilters;

  initState() {
    gluttenFree = widget.currentFilter['gluten'];
    vegetarian = widget.currentFilter['vegetarian'];
    vegan = widget.currentFilter['vegan'];
    lactoseFree = widget.currentFilter['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(String text, bool filter, Function updateValue) {
    return SwitchListTile(
      title: Text('$text'),
      subtitle: Text("Only include $text meals"),
      value: filter,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                selectedFilters = {
                  'gluten': gluttenFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                  'lactose': lactoseFree
                };
                widget.saveState(selectedFilters);
                Navigator.of(context).pushReplacementNamed('/');
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Adjust your Meal selection",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free', gluttenFree, (newValue) {
                  setState(() {
                    gluttenFree = newValue;
                  });
                }),
                _buildSwitchListTile("Vegetarian", vegetarian, (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile("vegan", vegan, (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                }),
                _buildSwitchListTile('Lactose-free', lactoseFree, (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
