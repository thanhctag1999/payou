import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.id,
    this.name,
    this.type,
    this.color,
  });
  final id;
  final name;
  final type;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 223, 234, 255).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: colors[color], borderRadius: BorderRadius.circular(10)),
          ),
          Text(
            name.toString(),
            style: GoogleFonts.notoSansMongolian(
                fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type.toString(),
                style: GoogleFonts.coiny(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: type == "Spent"
                        ? const Color.fromARGB(255, 255, 18, 50)
                        : const Color.fromARGB(255, 13, 209, 95)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
