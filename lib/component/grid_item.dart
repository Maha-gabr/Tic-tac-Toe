import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/app_colors.dart';

typedef OnClicked = void Function(int);

class GridItem extends StatelessWidget {
  final String symbol;
  final OnClicked onClicked;
  final int index;
  final bool showRightBorder;
  final bool showBottomBorder;
  const GridItem({
    super.key,
    required this.symbol,
    required this.onClicked,
    required this.index,
    required this.showBottomBorder,
    required this.showRightBorder
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onClicked(index);
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: showBottomBorder ? BorderSide(
                  width: 2, color: AppColors.blackColor) : BorderSide.none,
              right: showRightBorder ? BorderSide(
                  width: 2, color: AppColors.blackColor) : BorderSide.none,
            ),
          ),
          child: symbol.isNotEmpty
              ? Image.asset(
              'assets/images/${symbol}_image.png', height: 75, width: 75)
              : Text(''),
        ),
      ),
    );
  }
}
