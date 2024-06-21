import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThirdFeature extends StatelessWidget {
  const ThirdFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBtn(
            text: 'Electricity',
            color: const Color.fromARGB(255, 255, 210, 193),
            icon: FaIcon(
              FontAwesomeIcons.lightbulb,
              color: primaryColor,
            ),
          ),
          CustomBtn(
            text: 'Movie',
            color: const Color.fromARGB(255, 255, 236, 183),
            icon: RotatedBox(
              quarterTurns: 90,
              child: FaIcon(
                FontAwesomeIcons.ticket,
                color: primaryColor,
              ),
            ),
          ),
          CustomBtn(
            text: 'Store',
            color: const Color.fromARGB(255, 215, 255, 232),
            icon: FaIcon(
              FontAwesomeIcons.store,
              color: primaryColor,
            ),
          ),
          CustomBtn(
            text: 'More',
            color: const Color.fromARGB(255, 215, 200, 255),
            icon: Icon(
              Icons.more_horiz,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
