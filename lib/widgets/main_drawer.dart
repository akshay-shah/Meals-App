import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  void _onSelectedMeals(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }

  void _onSelectedSettings(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Meals'),
            onTap: () => _onSelectedMeals(context),
            subtitle: Text('Your meals page'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => _onSelectedSettings(context),
            subtitle: Text('Settings for your meals'),
          ),
        ],
      ),
    );
  }
}
