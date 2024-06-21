import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.text, this.icon, this.color});
  final text;
  final icon;
  final color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 219, 233, 253).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: icon,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style:
              GoogleFonts.notoSansMongolian(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
