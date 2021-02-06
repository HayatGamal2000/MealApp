import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meals.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './widgets/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleMeals(String mealId){
    final existingIndex =
    _favoriteMeal.indexWhere((meal) => meal.id==mealId);
  if (existingIndex >=0){
    setState(() {
      _favoriteMeal.removeAt(existingIndex);
    }
    );
  }else {
    setState(() {
      _favoriteMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
    });
  }
  }

  bool _isMealFavourite(String id){
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cooking Recipes',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.pinkAccent,
        canvasColor: Color.fromRGBO(225, 254, 240, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed'
          )
        )
      ),
      //home:TabsScreen(),
      initialRoute: '/',
      routes: {
        '/':(ctx) =>TabsScreen(_favoriteMeal ),
        CategoryMeals.routName : (ctx)=> CategoryMeals(_availableMeals),
        MealDetailScreen.routName : (ctx) =>MealDetailScreen(_toggleMeals,_isMealFavourite),
        FiltersScreen.routName : (ctx)=> FiltersScreen(_filters,_setFilters),
      },
    );
    }
}


