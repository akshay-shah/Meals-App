import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

/// does not require widget to be stateful
// Widget buildTopBar() {
//   return DefaultTabController(
//     length: 2,
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('Meals App'),
//         bottom: TabBar(tabs: [
//           Tab(
//             icon: Icon(Icons.category),
//             text: 'Categories',
//           ),
//           Tab(
//             icon: Icon(Icons.star),
//             text: 'Favourites',
//           )
//         ]),
//       ),
//       drawer: Drawer(),
//       body: TabBarView(
//         children: [
//           CategoriesScreen(),
//           FavouriteScreen(),
//         ],
//       ),
//     ),
//   );
// }

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;

  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouriteScreen(),
      'title': 'Your favourites',
    },
  ];

  void _selectedTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  BottomNavigationBarItem createBootomNavigationBarItem(
      String title, Icon icon) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: icon,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        items: [
          createBootomNavigationBarItem('Categories', Icon(Icons.category)),
          createBootomNavigationBarItem('Favourites', Icon(Icons.star)),
        ],
      ),
    );
  }
}
