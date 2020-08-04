import 'dart:math';

import 'package:falukaa/utils/fish.dart';
import 'package:flutter/material.dart';

class FishTile extends StatelessWidget {
  final Fish fish;

  const FishTile({Key key, this.fish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double top = constraints.maxHeight * 1 / 3;
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/fish", arguments: fish),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(8.0, top, 8.0, 8.0),
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 3),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Transform.rotate(
                        angle: -pi * 3 / 4,
                        child: Image.asset("assets/images/icon.png"),
                      ),
                    ),
                    Text(fish.name),
                    SizedBox(height: 8),
                    Text("\$ ${fish.price}"),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
