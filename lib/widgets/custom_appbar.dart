import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Pay',
              style: GoogleFonts.coiny(
                  color: primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: 'ou',
                    style: GoogleFonts.coiny(
                      fontWeight: FontWeight.bold,
                      color: secondColor,
                      fontSize: 32,
                    )),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    {}
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                    color: primaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    {}
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.bell,
                    color: primaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    {}
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.award,
                    color: primaryColor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
