import 'package:falukaa/utils/category.dart';
import 'package:falukaa/utils/fish.dart';
import 'package:falukaa/widgets/fish_tile.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Category category = ModalRoute.of(context).settings.arguments;
    if (category == null) {
      print("Wrong category");
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .8,
        physics: BouncingScrollPhysics(),
        children: Fish.withCategory(category)
            .map(
              (fish) => FishTile(fish: fish),
            )
            .toList(),
      ),
    );
  }
}
