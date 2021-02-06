import 'package:flutter/material.dart';
import 'file:///C:/Users/hayat%20gamal/AndroidStudioProjects/meals_app/lib/widgets/categories_item.dart';
import 'package:meals_app/dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding :const EdgeInsets.all(15) ,
        children: dummy_categories.map((catData) => CategoryItem(
          catData.id,
          catData.title,
          catData.color,
        )).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3.5/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
    );

  }
}
