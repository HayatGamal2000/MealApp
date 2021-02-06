import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  
  CategoryItem (this.id,this.title,this.color);

 void selectCategory (BuildContext ctx) {
   Navigator.of(ctx).pushNamed(CategoryMeals.routName,
     arguments: {
       'id': id,
       'title' : title,
       'color' :color
     }
   );
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
