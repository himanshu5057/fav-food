import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  Items(this.title, this.color, this.id);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/categories-meals', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
