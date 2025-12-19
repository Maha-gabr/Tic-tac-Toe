import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/app_colors.dart';

import '../component/grid_item.dart';

class BoardScreen extends StatelessWidget {
  static String routeName = 'boardScreen';

  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blueColor, AppColors.lightBlueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadiusGeometry.circular(44)
                ),
                child: Text('00:05', style: GoogleFonts.montserrat(fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor),)
            ),
            Text('', style: GoogleFonts.montserrat(fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor),),
            Expanded(
              child: Container(
                color: AppColors.whiteColor,
                child: Column(
                  children: List.generate(3, (rowIndex) {
                    return Expanded(
                      child: Row(
                          children:
                          List.generate(3, (gridIndex) {
                            return GridItem(
                              symbol: 'x',
                              index: rowIndex * 3 + gridIndex,
                              onClicked: onPressed,
                            );
                          })
                      ),
                    );
                  }
                  )

                  ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onPressed(int index) {

  }
}
