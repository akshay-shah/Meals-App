import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meals_item.dart';

// ignore: must_be_immutable
class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String catTitle;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catId = routeArgs["id"];
    catTitle = routeArgs["title"];
    widget.availableMeal = widget.availableMeal.where((meals) {
      return meals.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String value) {
    setState(() {
      widget.availableMeal.removeWhere((element) => element.id == value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mealId: widget.availableMeal[index].id,
            title: widget.availableMeal[index].title,
            imageUrl: widget.availableMeal[index].imageUrl,
            duration: widget.availableMeal[index].duration,
            affordability: widget.availableMeal[index].affordability,
            complexity: widget.availableMeal[index].complexity,
            removeItem: removeItem,
          );
        },
        itemCount: widget.availableMeal.length,
      ),
    );
  }
}
