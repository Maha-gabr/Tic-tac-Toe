import 'package:flutter/material.dart';

typedef OnClicked = void Function(int index);

class GridItem extends StatelessWidget {
  final String symbol;
  final OnClicked onClicked;
  final int index;

  const GridItem({
    super.key,
    required this.symbol,
    required this.onClicked,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onClicked(index);
        },
        child: Container(
          child: Image.asset('assets/images/${symbol}_image.png'),
        ),
      ),
    );
  }
}
