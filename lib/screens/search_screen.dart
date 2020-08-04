import 'package:falukaa/utils/fish.dart';
import 'package:falukaa/widgets/category_tile.dart';
import 'package:falukaa/widgets/fish_list.dart';
import 'package:falukaa/widgets/fish_tile.dart';
import 'package:falukaa/widgets/search_container.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: FishList(
        fishes: Fish.all.where((element) => element.name.toLowerCase().contains(
              search.toLowerCase(),
            )).toList(),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Hero(
          tag: "search",
          child: Material(
            color: Colors.transparent,
            child: SearchContainer(
              search: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autofocus: true,
                  onChanged: (value) => setState(() => search = value),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
