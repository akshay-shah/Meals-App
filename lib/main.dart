import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      // initial route is to be used when you do not want default route to be used
      initialRoute: '/',
      routes: {
        // if not using home use this as default route
        // if using home do not use this.
        '/': (_) => TabsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => CategoriesScreen(),
      ),
    );
  }
}
