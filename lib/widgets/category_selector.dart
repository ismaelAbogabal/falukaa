import 'dart:math';

import 'package:falukaa/utils/category.dart';
import 'package:falukaa/widgets/category_tile.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategorySelector extends StatefulWidget {
  final Function(Category) onChange;

  const CategorySelector({Key key, this.onChange}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final categories = Category.all;
  final double bigOneX = 0.6;
  double bigOneY = 0.95;

  double current = 0.0;

  PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        current = pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bigOneY = .9;
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: <Widget>[
          for (int i = categories.length - 1; i >= 0; i--)
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..translate(
                  calcX(i - current, constraints.maxWidth) + 15,
                  calcY(i - current, constraints.maxHeight),
                )
                ..rotateZ(calcRotate(i - current)),
              child: Container(
                width: bigOneX * constraints.maxWidth,
                height: bigOneY * constraints.maxHeight,
                child: CategoryTile(categories[i]),
              ),
            ),
          PageView(
            controller: pageController,
            onPageChanged: (i) {
              widget.onChange?.call(categories[i]);
            },
            physics: BouncingScrollPhysics(),
            children: categories.map((category) => Container()).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
                controller: pageController, // PageController
                count: categories.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: categories[current.round()].color,
                ), // your preferred effect
                onDotClicked: (index) {}),
          ),
        ],
      ),
    );
  }

  double calcX(double num, double width) {
    if (num <= 0) {
      return num * width;
    } else {
      return width * (1 - bigOneX) * atan(num) / 1.5;
    }
  }

  double calcY(double num, double width) {
    if (num <= 0) {
      return 0;
    } else {
      return width * (1 - bigOneY) * atan(num) / 1.5;
    }
  }

  double calcRotate(double num) {
    if (num >= 0) return 0;
    return pi / 2 * num;
  }
}
