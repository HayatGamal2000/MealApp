import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName ='/Filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title ,
      String description,
      bool currentValue,
      Function updateValue,
      ){
    return SwitchListTile (
      title : Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  initState(){
  _glutenFree = widget.currentFilters['gluten'];
  _lactoseFree = widget.currentFilters['lactose'];
  _vegan = widget.currentFilters['vegan'];
  _vegetarian = widget.currentFilters['vegetarian'];
  super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Your Filters'),
      actions: [
        IconButton(icon: Icon(Icons.save),
            onPressed:(){
          final selectedFilters ={
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
              widget.saveFilters(selectedFilters);
              print(selectedFilters);
            },
          ),
      ],),
      
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
                'Adjust your meal selection!',
                style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchListTile(
                 'Gluten-free',
                 'only include gluten-free meals.',
                  _glutenFree,
                  (newValue1) {
                   setState(
                           () {
                     _glutenFree = newValue1;
                     print(_glutenFree);
                   });
                  }
              ),
              _buildSwitchListTile(
                   'Lactose-Free',
                   'only include lactose-free meals.',
                   _lactoseFree,
                    (newValue2) {
                  setState(() {
                    _lactoseFree = newValue2;
                    print(_lactoseFree);
                  });
                }),
              _buildSwitchListTile(
                'Vegetarian',
                'only include vegetarian meals.',
                _vegetarian,
                    (newValue3){
                  setState(() {
                    _vegetarian = newValue3;
                    print(_vegetarian);
                  });
                }),
              _buildSwitchListTile(
                'Vegan',
                'only include vegan meals.',
                _vegan,
                    (newValue4){
                  setState(() {
                    _vegan = newValue4;
                    print(_vegan);
                  });
                }),
            ],
          ))
        ],
      )
    );
  }
}
