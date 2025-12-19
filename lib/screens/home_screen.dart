import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/app_colors.dart';

import '../component/player_item.dart';
class HomeScreen extends StatelessWidget {
  static String routeName = 'homeScreen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_image.png'),
              fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Pick who goes first', style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor),),
            Row(
              spacing: 15,
              children: [
                SizedBox(height: 16),
                PlayerItem(symbol: 'x',),
                PlayerItem(symbol: 'o',),
                SizedBox(height: 16),
              ],
            ),
            SizedBox(height: 26),
          ],

        ),
      ),
    );
  }
}
