import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/MealDetail';
  Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen( this.toggleFavourite,this.isFavourite);

  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style: Theme.of(context).textTheme.title),
    );
  }

  Widget buildContainer (child){
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(20),
    height: 180,
    width: 300,
    child: child,
    );
    }

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context).settings.arguments as Map<String,Object>;
    final mealId = routArgs['id'];
    final catColor = routArgs['color'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
        appBar: AppBar(
        title: Text(selectedMeal.title),
        backgroundColor: catColor,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: 280,
                width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,
              fit:BoxFit.cover,
              ),
            ),
            buildSectionTitle(context,'Ingredients'),
            buildContainer( ListView.builder(
                    itemBuilder: (ctx,index)=> Card(
                      color: catColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal:10 ),
                          child: Text(selectedMeal.ingredients[index])),
                    ),
                itemCount: selectedMeal.ingredients.length,
                ),),
            buildSectionTitle(context,'Steps'),
            buildContainer(ListView.builder(
                itemBuilder: (ctx , index) =>Column(children: [ListTile(
                  leading: CircleAvatar(
                    child: Text('${index+1}',),
                    backgroundColor: catColor,
                    ),
                  title: Text(selectedMeal.steps[index]),
                ),
                  Divider(),],
                ),itemCount: selectedMeal.steps.length,
            )),
          ],),
        ),
    floatingActionButton:FloatingActionButton(
        child: Icon(
          isFavourite(mealId)? Icons.star
              : Icons.star_border
        ) ,
        onPressed: ()=> toggleFavourite(mealId),
    backgroundColor: routArgs['color'],
    )
      ,
    );
  }
}