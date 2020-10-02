import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail-screen';

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget buildBody(Widget child) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        height: 120,
        width: double.infinity,
        child: Scrollbar(
          child: child,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArguments['id'];
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              buildTitle(context, 'Ingredients'),
              buildBody(
                ListView.builder(
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(selectedMeal.ingredients[index])),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildTitle(context, 'Steps'),
              buildBody(
                ListView.builder(
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(selectedMeal.steps[index])),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => {
          Navigator.of(context).pop(mealId),
        },
      ),
    );
  }
}
