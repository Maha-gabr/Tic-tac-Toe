import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class PlayerItem extends StatelessWidget {
  final String symbol;

  const PlayerItem({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(39),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadiusGeometry.circular(32),
          ),
          child: Image.asset('assets/images/${symbol}_image.png'),
        ),
      ),
    );
  }
}
