import 'package:falukaa/utils/prices.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        child: Center(child: Image.asset("assets/images/splash.png")),
      ),
    );
  }

  init(BuildContext context) async {
    var snap = await FirebaseDatabase.instance.reference().child("data").once();
    prices = (snap.value as Map).cast<String, Map>();
    print(prices);
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
