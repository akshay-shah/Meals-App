import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.setFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var lactoseFree = false;

  Widget createFilters(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      onChanged: updateValue,
      value: currentValue,
      subtitle: Text(description),
    );
  }

  @override
  void initState() {
    glutenFree = widget.filters['gluten'];
    isVegan = widget.filters['vegan'];
    isVegetarian = widget.filters['vegetarian'];
    lactoseFree = widget.filters['lactose'];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, bool>;
    if (arguments != null) {
      glutenFree = arguments['gluten'];
      lactoseFree = arguments['lactose'];
      isVegan = arguments['vegan'];
      isVegetarian = arguments['vegetarian'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => {
              widget.setFilters(
                {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                },
              ),
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust Meal Settings',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  createFilters(
                    'Gluten-Free',
                    "Only gluten free meals will be added",
                    glutenFree,
                    (value) {
                      setState(() {
                        glutenFree = value;
                      });
                    },
                  ),
                  createFilters(
                    'Lactose-Free',
                    "Only lactose free meals will be added",
                    lactoseFree,
                    (value) {
                      setState(() {
                        lactoseFree = value;
                      });
                    },
                  ),
                  createFilters(
                    'Vegan',
                    "Only vegan meals will be added",
                    isVegan,
                    (value) {
                      setState(() {
                        isVegan = value;
                      });
                    },
                  ),
                  createFilters(
                    'Vegetarian',
                    "Only vegetarian meals will be added",
                    isVegetarian,
                    (value) {
                      setState(() {
                        isVegetarian = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
