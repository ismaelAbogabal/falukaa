import 'dart:math';

import 'package:falukaa/utils/fish.dart';
import 'package:falukaa/widgets/fish_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FishList extends StatefulWidget {
  final List<Fish> fishes;

  const FishList({Key key, this.fishes}) : super(key: key);
  @override
  _FishListState createState() => _FishListState();
}

class _FishListState extends State<FishList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 1,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.fishes.length,
        itemBuilder: (context, index) => Center(
          child: Transform.scale(
            scale: cutAnimation(
              _controller.value,
              min(.4, index * .1),
              min(1, .6 + index * .2),
            ),
            child: FishTile(
              fish: widget.fishes[index],
            ),
          ),
        ),
        staggeredTileBuilder: (index) =>
            StaggeredTile.extent(1, 250.0 + (index % 5) * 10),
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
