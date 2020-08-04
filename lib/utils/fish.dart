import 'package:falukaa/utils/category.dart';
import 'package:falukaa/utils/prices.dart';
import 'package:flutter/material.dart';

class Fish {
  final Category category;
  final String name;

  const Fish._({
    @required this.category,
    @required this.name,
  });

  double get price => prices[name]["price"].toDouble() ?? -1;
  bool get sellWithKilo => prices[name]["byKilo"] ?? true;

  static List<Fish> withCategory(Category category) =>
      all.where((element) => element.category == category).toList();

  static List<Fish> searchName(String name) =>
      all.where((element) => element.name.contains(name)).toList();

  //declare all kandu fish
  static const reendhooUraha = Fish._(
    name: "reendhoo uraha",
    category: Category.kandu,
  );
  static const kalhubilaMas = Fish._(
    name: " kalhubila mas",
    category: Category.kandu,
  );
  static const latti = Fish._(
    name: "latti",
    category: Category.kandu,
  );
  static const raagondi = Fish._(
    name: "raagondi",
    category: Category.kandu,
  );
  static const kurumas = Fish._(
    name: "kurumas",
    category: Category.kandu,
  );
  static const fannganduHibaru = Fish._(
    name: "fanngandu hibaru",
    category: Category.kandu,
  );
  static const kalhuMasHibaru = Fish._(
    name: "kalhu mas hibaru",
    category: Category.kandu,
  );
  static const nooMasHibaru = Fish._(
    name: "noo mas hibaru",
    category: Category.kandu,
  );
  static const thungaduHibaru = Fish._(
    name: "thungadu hibaru",
    category: Category.kandu,
  );
  static const femunuMiyaru = Fish._(
    name: "femunu miyaru",
    category: Category.kandu,
  );

  // declare vilu fish
  static const tholhi = Fish._(
    name: "tholhi",
    category: Category.vilu,
  );
  static const faniHandhi = Fish._(
    name: "fani handhi",
    category: Category.vilu,
  );
  static const kalhaHandhi = Fish._(
    name: "kalha handhi",
    category: Category.vilu,
  );
  static const mudaHandhi = Fish._(
    name: "muda handhi",
    category: Category.vilu,
  );
  static const maniyaMas = Fish._(
    name: "maniya mas",
    category: Category.vilu,
  );
  static const voshimasMiyaru = Fish._(
    name: "voshimas miyaru",
    category: Category.vilu,
  );

  //declare fura fishes

  static const faana = Fish._(
    name: "faana",
    category: Category.faru,
  );

  static const raiMas = Fish._(
    name: "rai mas",
    category: Category.faru,
  );

  static const giniMas = Fish._(
    name: "gini mas",
    category: Category.faru,
  );

  // declare falhu fishes
  static const kirulhiyaMas = Fish._(
    name: "kirulhiya mas",
    category: Category.falhu,
  );
  static const dhonnooMas = Fish._(
    name: "dhonnoo mas",
    category: Category.falhu,
  );
  static const mushimas = Fish._(
    name: "mushimas",
    category: Category.falhu,
  );
  static const rinmas = Fish._(
    name: "rinmas",
    category: Category.falhu,
  );

  // declare ehgamu fishes

  static const walhomas = Fish._(
    name: "walhomas",
    category: Category.ehgamu,
  );
  static const hikimas = Fish._(
    name: "hikimas",
    category: Category.ehgamu,
  );

  static const all = [
    reendhooUraha,
    kalhubilaMas,
    latti,
    raagondi,
    kurumas,
    fannganduHibaru,
    kalhuMasHibaru,
    nooMasHibaru,
    thungaduHibaru,
    femunuMiyaru,
    tholhi,
    faniHandhi,
    kalhaHandhi,
    mudaHandhi,
    maniyaMas,
    voshimasMiyaru,
    faana,
    raiMas,
    giniMas,
    kirulhiyaMas,
    dhonnooMas,
    mushimas,
    rinmas,
    walhomas,
    hikimas,
  ];
}
