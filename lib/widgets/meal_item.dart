import 'package:flutter/material.dart';
import '../Screens/meal_details.dart';
import '/Models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final String imageUrl;
  final Affordability affordability;

  MealItem(
      {required this.id,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.imageUrl,
      required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                //product image cornered top
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 15,
                            // overflow: TextOverflow.fade,
                            color: Colors.white),
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //information below image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text('$duration min'),
                  ]),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
