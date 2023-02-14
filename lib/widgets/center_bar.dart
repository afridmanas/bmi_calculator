import 'package:bmi_calculator/constants/app_constant.dart';
import 'package:flutter/material.dart';

class CenterBar extends StatelessWidget {
  final double barwidth;

  const CenterBar({
    Key? key,
    required this.barwidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 25,
          width: barwidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: accentHexColor,
          ),
        ),
      ],
    );
  }
}
