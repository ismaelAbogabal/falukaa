import 'dart:math';

import 'package:falukaa/utils/fish.dart';
import 'package:flutter/material.dart';

class MovingFish extends StatefulWidget {
  final Fish fish;

  const MovingFish({Key key, this.fish}) : super(key: key);
  @override
  _MovingFishState createState() => _MovingFishState();
}

class _MovingFishState extends State<MovingFish> with TickerProviderStateMixin {
  AnimationController _controllerX;
  AnimationController _controllerY;
  AnimationController _controllerRotate;

  @override
  void initState() {
    _controllerX = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: -1,
      upperBound: 1,
    );
    _controllerY = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: -1,
      upperBound: 1,
    );
    _controllerRotate = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: -pi,
      upperBound: pi,
    );

    _controllerX.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        getMove();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerX.dispose();
    _controllerY.dispose();
    _controllerRotate.dispose();

    super.dispose();
  }

  Size size;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    getMove();
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white, widget.fish.category.color],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: AnimatedBuilder(
        animation: _controllerX,
        builder: (context, child) {
          return Container(
            alignment: Alignment(_controllerX.value, _controllerY.value),
            child: Transform.rotate(
              angle: _controllerRotate.value,
              child: child,
            ),
          );
        },
        child: Image.asset(
          "assets/images/icon.png",
          width: 150,
          height: 150,
        ),
      ),
    );
  }

  final max = 100000;
  void getMove() {
    double x = random.nextInt(2 * max) / max - 1;
    double y = random.nextInt(2 * max) / max - 1;

    bool left = x - _controllerX.value < 0;

    var delta = (_controllerY.value - y) / (_controllerX.value - x);
    double rotate = atan(delta);

    if (left) {
      if (rotate > 0) {
        rotate *= -1;
        rotate -= pi / 2;
      } else {
        rotate *= -1;
        rotate += pi / 2;
      }
    }

    _controllerX.animateTo(x, duration: Duration(seconds: 5));
    _controllerY.animateTo(y, duration: Duration(seconds: 5));
    _controllerRotate.animateTo(
      rotate,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }
}
