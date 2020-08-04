import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  final Widget search;

  const SearchContainer({Key key, @required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: search,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(blurRadius: 3, color: Colors.black26, offset: Offset(2, 3))
        ],
      ),
    );
  }
}
