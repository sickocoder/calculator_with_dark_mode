import 'package:calculator_with_dark_mode/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/tab.dart';

class NumberPadItem {
  String symbol;
  bool isOperator;
  bool isRed;

  NumberPadItem(this.symbol, this.isRed, {this.isOperator = false});
}

class CalculatorPage extends StatelessWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool darkModeOn =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.07,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HomeTab(title: 'Standard', isSelected: true),
                    HomeTab(title: 'Scientific', isSelected: false),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('45 x 8 ÷ 2',
                          style: AppTextStyles.operationAfterResult),
                      Text('180', style: AppTextStyles.result),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _generateNumberPadLine([
                      NumberPadItem('C', false),
                      NumberPadItem('%', false),
                      NumberPadItem('±', false),
                      NumberPadItem('÷', true),
                    ], darkModeOn),
                    _generateNumberPadLine([
                      NumberPadItem('7', false),
                      NumberPadItem('8', false),
                      NumberPadItem('9', false),
                      NumberPadItem('x', true),
                    ], darkModeOn),
                    _generateNumberPadLine([
                      NumberPadItem('4', false),
                      NumberPadItem('5', false),
                      NumberPadItem('6', false),
                      NumberPadItem('-', true),
                    ], darkModeOn),
                    _generateNumberPadLine([
                      NumberPadItem('1', false),
                      NumberPadItem('2', false),
                      NumberPadItem('3', false),
                      NumberPadItem('+', true),
                    ], darkModeOn),
                    _generateNumberPadLine([
                      NumberPadItem('10', false),
                      NumberPadItem('0', false),
                      NumberPadItem('.', false),
                      NumberPadItem('=', false, isOperator: true),
                    ], darkModeOn),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _generateNumberPadLine(List<NumberPadItem> items, bool darkModeOn) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
          .map(
            (e) => Container(
              width: 72,
              height: 80,
              child: Center(
                child: Container(
                  width: e.isOperator ? 48 : null,
                  height: e.isOperator ? 48 : 80,
                  decoration: BoxDecoration(
                    color: e.isOperator ? Colors.red : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: e.symbol != '10'
                        ? Text(
                            e.symbol,
                            style: e.isRed
                                ? AppTextStyles.numberPadSizeRed
                                : AppTextStyles.numberPadSize,
                          )
                        : SvgPicture.asset(
                            darkModeOn
                                ? 'images/svg/x-square.svg'
                                : 'images/svg/x-square-black.svg',
                            width: 40,
                          ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
