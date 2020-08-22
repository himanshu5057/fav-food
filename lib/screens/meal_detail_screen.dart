import 'package:fav_food/dummy_data.dart';
import 'package:flutter/material.dart';
class MealDetailScreen extends StatelessWidget {
  Function favScreen;
  Function fav;
  MealDetailScreen(this.favScreen,this.fav);
  @override
  Widget build(BuildContext context) {
    final detailArgs = ModalRoute.of(context).settings.arguments as String;
    final details = DUMMY_MEALS.firstWhere((detail) => detail.id == detailArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                details.imageUrl,
                height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text("INGREDIENTS"),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              height: 250,
              width: 250,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 10,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text(details.ingredients[index]),
                          ],
                        )),
                  );
                },
                itemCount: details.ingredients.length,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Text("STEPS"),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              height: 250,
              width: 250,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      (Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.yellow),
                                borderRadius: BorderRadius.circular(100)),
                            child: Text(' ${(index + 1)} '),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                              width: 210,
                              padding: EdgeInsets.all(5),
                              child: Text(details.steps[index])),
                        ],
                      )),
                      Divider()
                    ],
                  );
                },
                itemCount: details.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => favScreen(detailArgs),
          child: Icon(
            fav(detailArgs)?Icons.favorite:Icons.favorite_border

          )),
    );
  }
}
