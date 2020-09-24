import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String MEAL_DETAIL_SCREEN = '/meal-detail-screen';
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArguments['id'];
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              height: 100,
              width: 300,
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(selectedMeal.ingredients[index])),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
