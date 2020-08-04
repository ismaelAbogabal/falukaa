import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;
  final Color color;

  const Category._({
    @required this.name,
    @required this.image,
    this.color = Colors.transparent,
  });

  static const Category kandu = Category._(
    name: "kandu",
    image: null,
    color: Colors.purpleAccent,
  );
  static const Category vilu = Category._(
    name: "vilu",
    image: null,
    color: Colors.yellow,
  );
  static const Category faru = Category._(
    name: "faru",
    image: null,
    color: Colors.blueAccent,
  );
  static const Category falhu = Category._(
    name: "falhu",
    image: null,
    color: Colors.orange,
  );
  static const Category ehgamu = Category._(
    name: "ehgamu",
    image: null,
    color: Colors.green,
  );

  static const List<Category> all = const [kandu, vilu, faru, falhu, ehgamu];
}
