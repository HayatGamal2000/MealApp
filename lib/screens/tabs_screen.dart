import 'package:flutter/material.dart';
import '../models/meals.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoritedMeal ;

  TabsScreen(this.favoritedMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text('Cooking Recipes'),
          bottom: TabBar(
            tabs:<Widget> [
          Tab(
            icon: Icon(Icons.restaurant_menu),
            text: 'Categories',
          ),
          Tab(
            icon: Icon(Icons.star),
            text: 'Favorites',
          ),
        ]),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen(widget.favoritedMeal),
        ]),
      ),
    );
  }
}
