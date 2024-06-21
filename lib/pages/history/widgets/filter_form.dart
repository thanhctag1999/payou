import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/custom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({super.key});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBtn(
          text: 'All',
          color: Colors.white,
          icon: FaIcon(
            FontAwesomeIcons.rotateLeft,
            color: primaryColor,
          ),
        ),
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
        CustomBtn(
          text: 'Failed',
          color: Colors.white,
          icon: RotatedBox(
            quarterTurns: 90,
            child: FaIcon(
              FontAwesomeIcons.clockFour,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
