import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/app_colors.dart';

import '../component/grid_item.dart';

class BoardScreen extends StatefulWidget {
  static String routeName = 'boardScreen';

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final ConfettiController _confettiController = ConfettiController(
      duration: Duration(seconds: 2)
  );

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  List <String> symbolsList = List.filled(9, '');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ AppColors.lightBlueColor, AppColors.blueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 25),
                child: Column(
                  spacing: 32,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 19),
                        alignment: .center,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadiusGeometry.circular(44)
                        ),
                        child: Text(
                          '00:05', style: GoogleFonts.montserrat(fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor),)
                    ),
                    Text('Player 1’s Turn',
                      style: GoogleFonts.montserrat(fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadiusGeometry.circular(44)
                        ),
                        child: Column(
                          children: List.generate(3, (rowIndex) {
                            return Expanded(
                              child: Row(
                                  children:
                                  List.generate(3, (gridIndex) {
                                    int index = rowIndex * 3 + gridIndex;
                                    return GridItem(
                                      showRightBorder: gridIndex < 2,
                                      showBottomBorder: rowIndex < 2,
                                      symbol: symbolsList[index],
                                      index: index,
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
            ),
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: pi / 2,
              // اتجاه لفوق
              emissionFrequency: 0.05,
              // كثافة
              numberOfParticles: 30,
              // عدد
              gravity: 0.3,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.purple,
              ],
            ),
          ],
        ),
      ),
    );
  }

  int xCounter = 0;
  int yCounter = 0;
  int counter = 0;
  onPressed(int index) {
    if (symbolsList[index].isNotEmpty) return;
    if (counter % 2 == 0) {
      symbolsList[index] = 'x';
    } else {
      symbolsList[index] = 'o';
    }
    if (checkWinner('x')) {
      _confettiController.play();
      Future.delayed(Duration(seconds: 1), initBoard);
    } else if (checkWinner('o')) {
      _confettiController.play();
      Future.delayed(Duration(seconds: 1,), initBoard);
    }
    if (counter == 9) {
      Future.delayed(Duration(seconds: 1,), initBoard);
    }
    counter++;
    setState(() {});

  }

  bool checkWinner(String symbol) {
    List <List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 6],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    return winningCombinations.any((comb) =>
        comb.every((index) => symbolsList[index] == symbol));
  }

  initBoard() {
    symbolsList = List.filled(9, '');
    counter = 0;
    setState(() {});
  }

}
