import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomSliderItem extends StatelessWidget {
  const HomSliderItem({
    super.key,
    this.icon,
    this.title,
    this.description,
    this.background1,
    this.background2,
  });
  final icon;
  final title;
  final description;
  final background1;
  final background2;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [background1, background2],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toString(),
                  style: GoogleFonts.notoSansMongolian(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  description.toString(),
                  maxLines: 2,
                  style: GoogleFonts.notoSansMongolian(
                    color: primaryColor,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
