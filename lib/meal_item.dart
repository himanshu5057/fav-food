import 'package:fav_food/modals/mealsSpecs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bubbleMessage.dart';

class MealItem extends StatelessWidget {
  String getComplexity() {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

  String getAffordability() {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'unknown';
    }
  }

  String id;
  String imageUrl;
  String title;
  int duration;
  final Affordability affordability;
  final Complexity complexity;
  MealItem(
      {@required this.id,
      @required this.imageUrl,
      @required this.title,
      @required this.duration,
      @required this.affordability,
      @required this.complexity});
  selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal-detail-screen', arguments: id).then((remove){
      if(remove!=null){
        // removeItem(remove);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: MediaQuery.of(context).size.height * .4,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    )),
                Positioned(
                    bottom: 20,
                    right: 10,
                    width: 320,
                    child: BubbleMessage(
                      painter: BubblePainter(),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          //     backgroundColor: Colors.black38),
                          // textDirection: TextDirection.rtl,
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.info_outline),
                    SizedBox(
                      width: 6,
                    ),
                    Text(getComplexity()),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(getAffordability())
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
