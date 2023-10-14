import 'package:flutter/material.dart';
import 'package:fruits_app/data/constants.dart';
import 'package:fruits_app/data/fruits_data.dart';
import 'package:fruits_app/entities/fruit.dart';
import 'package:fruits_app/fruit_item.dart';

class FruitList extends StatelessWidget {
  late final List<Fruit> fruits;
  FruitList({super.key}){
    fruits=prepareData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text(AppStrings.appName)),
        body: Center(
          child:ListView.builder(
            itemCount: fruits.length,
            itemBuilder: (context,index){
            return FruitItem(fruits[index]);
          }) 
        ),
    );
  }
  
  List<Fruit> prepareData() {
    return List<Fruit>.from(FruitsData.fruits.map((json) => Fruit().object(json)));
  }
}