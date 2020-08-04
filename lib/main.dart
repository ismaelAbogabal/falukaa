import 'package:falukaa/screens/category_screen.dart';
import 'package:falukaa/screens/fish_screen.dart';
import 'package:falukaa/screens/spash_screen.dart';
import 'package:falukaa/utils/fish.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

var blueText = TextStyle(color: Colors.indigo[800]);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Falukaa",
      theme: theme,
      initialRoute: "/splash",
      routes: {
        "/splash": (_) => SplashScreen(),
        "/": (_) => HomeScreen(),
        "/category": (_) => CategoryScreen(),
        "/fish": (_) => FishScreen(),
        "/search": (_) => SearchScreen(),
      },
    );
  }

  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.blue),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.blue,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ).apply(
            fontFamily: "Roboto",
          ),
        ),
      );
}
