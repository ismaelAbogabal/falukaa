import 'dart:math';

import 'package:falukaa/utils/fish.dart';
import 'package:falukaa/widgets/category_selector.dart';
import 'package:falukaa/widgets/fish_list.dart';
import 'package:falukaa/widgets/fish_tile.dart';
import 'package:falukaa/widgets/search_container.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/category.dart';

import '../widgets/category_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController controller;
  List<Fish> fishes = Fish.withCategory(Category.kandu);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);
    return Material(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            buildSearch(context),
            Text("\nCategory\n", textAlign: TextAlign.center),
            AspectRatio(
              child: CategorySelector(
                onChange: (category) {
                  setState(() {
                    fishes = Fish.withCategory(category);
                    print("Setstate");
                  });
                },
              ),
              aspectRatio: 1.2,
            ),
            FishList(fishes: fishes),
          ],
        ),
      ),
    );
  }

  Widget buildCategories() {
    return Expanded(
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        padding: const EdgeInsets.all(8.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: Category.all
            .map(
              (category) => CategoryTile(category),
            )
            .toList(),
      ),
    );
  }

  Widget buildSearch(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/search");
      },
      child: Hero(
        tag: "search",
        child: Material(
          child: SearchContainer(
            search: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black45,
                    size: 35,
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildCategorySelector() {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          PageView(
            controller: PageController(),
            children:
                Category.all.map((category) => CategoryTile(category)).toList(),
          ),
        ],
      ),
    );
  }

  double cutAnimation(double val, double from, double to) {
    if (val < from) return 0;
    if (val > to) return 1;
    double period = to - from;
    val -= from;

    return val / period;
  }
}
