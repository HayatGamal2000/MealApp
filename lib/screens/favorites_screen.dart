import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeal;
  FavoritesScreen (this.favoritedMeal);
  @override
  Widget build(BuildContext context) {
    if (favoritedMeal.isEmpty){
    return Center(
      child: Text("You haven't any favourites yet - start adding some!" ),

    );
  }else{
    return ListView.builder(
      itemBuilder: (ctx,index){
        return MealItem(
          id: favoritedMeal[index].id,
          title: favoritedMeal[index].title,
          imageUrl:favoritedMeal[index].imageUrl,
          duration:favoritedMeal[index].duration,
          complexity: favoritedMeal[index].complexity,
          affordability: favoritedMeal[index].affordability,
    );
      },itemCount: favoritedMeal.length,);
  }}
  }
