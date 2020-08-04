import 'package:flutter/material.dart';
import 'package:falukaa/utils/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, "/category", arguments: category),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          gradient: RadialGradient(
            colors: [
              Colors.white,
              category.color,
            ],
            stops: [.3, 1],
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(category.image ?? "assets/images/icon.png"),
            ),
            Text(category.name, style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
