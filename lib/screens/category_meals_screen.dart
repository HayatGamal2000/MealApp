import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meals.dart';
class CategoryMeals extends StatefulWidget {

  static const routName = '/categoryMeals';

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  var _loadedInitData = false;
  String categoryTitle;
  Color categoryColor;
  List <Meal> displayedMeal;

  @override
  void initState(){
    //..
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(! _loadedInitData){
      final routArgs = ModalRoute.of(context).settings.arguments as Map<String,Object>;
      final categoryId = routArgs['id'];
      categoryTitle = routArgs['title'];
      categoryColor = routArgs ['color'];
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categoriesId.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(itemBuilder: (ctx ,index){
           return MealItem(
               id: displayedMeal[index].id,
               title: displayedMeal[index].title,
               imageUrl:displayedMeal[index].imageUrl,
               duration:displayedMeal[index].duration,
               complexity: displayedMeal[index].complexity,
               affordability: displayedMeal[index].affordability,
               color : categoryColor,
           );
      }, itemCount:displayedMeal.length
        ,)
    );
  }
}

