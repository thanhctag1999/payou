import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondFeature extends StatelessWidget {
  const SecondFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBtn(
            text: 'Recharge',
            color: const Color.fromARGB(255, 255, 206, 133),
            icon: FaIcon(
              FontAwesomeIcons.mobilePhone,
              color: primaryColor,
            ),
          ),
          CustomBtn(
            text: 'Traveling',
            color: const Color.fromARGB(255, 193, 255, 226),
            icon: RotatedBox(
              quarterTurns: 90,
              child: FaIcon(
                FontAwesomeIcons.suitcaseRolling,
                color: primaryColor,
              ),
            ),
          ),
          CustomBtn(
            text: 'Hotel',
            color: const Color.fromARGB(255, 255, 215, 227),
            icon: FaIcon(
              FontAwesomeIcons.hotel,
              color: primaryColor,
            ),
          ),
          CustomBtn(
            text: 'Wifi',
            color: const Color.fromARGB(255, 200, 235, 255),
            icon: FaIcon(
              FontAwesomeIcons.wifi,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
