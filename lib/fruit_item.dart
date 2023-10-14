import 'package:flutter/material.dart';
import 'package:fruits_app/entities/fruit.dart';
import 'package:fruits_app/fruit_detail_page.dart';

class FruitItem extends StatelessWidget {
  const FruitItem(this.fruit,{super.key});

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.symmetric(horizontal:4),
      child: Card(
        elevation: 4,
        child: Padding(padding:const EdgeInsets.all(8),
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed("/$FruitDetail",arguments: fruit);
          },
          leading: Image.asset("assets/images/${fruit.thumbnail}"),
          title: Text(fruit.name!,style: Theme.of(context).textTheme.headlineSmall,),
          trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor,),
        ),),
      ),
    );
  }
}