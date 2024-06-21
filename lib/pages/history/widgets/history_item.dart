import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem(
      {super.key,
      this.icon,
      this.title,
      this.time,
      this.price,
      this.wallet,
      required this.isSend,
      this.background});
  final icon;
  final title;
  final time;
  final price;
  final wallet;
  final bool isSend;
  final background;

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
                color: background, borderRadius: BorderRadius.circular(20)),
            child: icon,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title.toString(),
                style: GoogleFonts.notoSansMongolian(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                time.toString(),
                style: GoogleFonts.notoSansMongolian(),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price.toString(),
                style: GoogleFonts.coiny(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isSend
                        ? const Color.fromARGB(255, 255, 18, 50)
                        : const Color.fromARGB(255, 13, 209, 95)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                wallet.toString(),
                style: GoogleFonts.notoSansMongolian(color: primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
