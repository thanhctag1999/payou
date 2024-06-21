import 'package:bank_ui/controllers/wallet_controller.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());

    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: primaryColor,
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
                  const FaIcon(
                    FontAwesomeIcons.wallet,
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
                        "Payou",
                        style: GoogleFonts.coiny(color: Colors.white),
                      ),
                      Text(
                        "Balance",
                        style: GoogleFonts.coiny(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '${controller.totalBalance.value}.000 vnd',
                style: GoogleFonts.coiny(color: Colors.white, fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(235, 157, 161, 238)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.circlePlus,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Add Money",
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
                "******",
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
