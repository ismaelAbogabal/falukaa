import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:falukaa/utils/fish.dart';
import 'package:falukaa/widgets/moving_fish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FishScreen extends StatefulWidget {
  @override
  _FishScreenState createState() => _FishScreenState();
}

class _FishScreenState extends State<FishScreen> {
  Fish fish;
  int num = 1;
  @override
  Widget build(BuildContext context) {
    fish ??= ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: MovingFish(fish: fish),
          ),
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TyperAnimatedTextKit(
                  text: [fish.name],
                  isRepeatingAnimation: false,
                  speed: Duration(milliseconds: 30),
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                TypewriterAnimatedTextKit(
                  text: ["Category: ${fish.category.name}"],
                  totalRepeatCount: 2,
                  textStyle: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Order", style: Theme.of(context).textTheme.headline5),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Material(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          fish.sellWithKilo ? "Kilo Order" : "Piece Order : ",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Expanded(
                          child: Center(
                            child: Text("\$${num * fish.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: Colors.blue)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          if (num > 1) {
                            setState(() {
                              num--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove_circle_outline, size: 45),
                        color: Colors.blue,
                      ),
                      Text(
                        "   $num  ",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            num++;
                          });
                        },
                        icon: Icon(Icons.add_circle_outline, size: 45),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
