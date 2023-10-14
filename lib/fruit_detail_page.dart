import 'package:flutter/material.dart';
import 'package:fruits_app/entities/fruit.dart';
import 'package:palette_generator/palette_generator.dart';

class FruitDetail extends StatefulWidget {
  const FruitDetail({required this.fruit, super.key});

  final Fruit fruit;
  @override
  State<FruitDetail> createState() => _FruitDetailState();
}

class _FruitDetailState extends State<FruitDetail> {
  Color appBarColor = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {findAppBarColor(); });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme= Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.fruit.name!),
              centerTitle: true,
              background: Image.asset("assets/images/${widget.fruit.imageName}",fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Taste:", style: textTheme.bodyLarge),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${widget.fruit.taste}",style: textTheme.bodyLarge!.apply(color: textTheme.bodyLarge!.color!.withOpacity(0.5) ),),
                  ),
                  SizedBox(height: 80,),
                  Text("Description:", style: textTheme.bodyLarge),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${widget.fruit.description}",style: textTheme.bodyLarge!.apply(color: textTheme.bodyLarge!.color!.withOpacity(0.5) ),),
                  ),
                  SizedBox(height: 80,),
                  Text("Calories: ${widget.fruit.nutrition!.calories}",
                      style: textTheme.bodyLarge),
                      SizedBox(
                    height: 20,
                  ),
                  Text("Fat: ${widget.fruit.nutrition!.fat}",
                      style: textTheme.bodyLarge),
                      SizedBox(
                    height: 20,
                  ),
                  Text("Sugar: ${widget.fruit.nutrition!.sugar}",
                      style: textTheme.bodyLarge),
                      SizedBox(
                    height: 20,
                  ),
                  Text("Carbohydrates: ${widget.fruit.nutrition!.carbohydrates}",
                      style: textTheme.bodyLarge),
                      SizedBox(
                    height: 20,
                  ),
                  Text("Protein: ${widget.fruit.nutrition!.protein}",
                      style: textTheme.bodyLarge),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  
  void findAppBarColor() async {
    _generator=await PaletteGenerator.fromImageProvider(AssetImage("assets/images/${widget.fruit.imageName}"));
    appBarColor=_generator.vibrantColor!.color;
    setState(() {});
  }
}
