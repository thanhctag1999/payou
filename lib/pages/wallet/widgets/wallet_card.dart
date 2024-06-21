import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    this.name,
    this.balance,
    this.background,
    this.id,
  });
  final id;
  final name;
  final balance;
  final background;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wallet,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name.toString(),
                        style: GoogleFonts.coiny(
                            color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '$balance.000 vnd',
                style: GoogleFonts.coiny(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: background),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Edit Wallet",
                      style: GoogleFonts.notoSansMongolian(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.googleWallet,
                color: Colors.white,
                size: 62,
              ),
              Text(
                "*** ***",
                style: GoogleFonts.notoSansMongolian(
                    color: Colors.white, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
