import 'package:bank_ui/pages/history/history_screen.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class PrimaryFeature extends StatelessWidget {
  const PrimaryFeature({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBtn(
            text: 'Send',
            color: Colors.white,
            icon: FaIcon(
              FontAwesomeIcons.arrowUpFromBracket,
              color: primaryColor,
            ),
          ),
          CustomBtn(
            text: 'Receive',
            color: Colors.white,
            icon: RotatedBox(
              quarterTurns: 90,
              child: FaIcon(
                FontAwesomeIcons.arrowUpFromBracket,
                color: primaryColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(const HistoryScreen());
            },
            child: CustomBtn(
              text: 'History',
              color: Colors.white,
              icon: FaIcon(
                FontAwesomeIcons.rotateLeft,
                color: primaryColor,
              ),
            ),
          ),
          CustomBtn(
            text: 'A/c Balance',
            color: Colors.white,
            icon: FaIcon(
              FontAwesomeIcons.question,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
