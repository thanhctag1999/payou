import 'package:bank_ui/controllers/wallet_controller.dart';
import 'package:bank_ui/pages/utils.dart';
import 'package:bank_ui/pages/wallet/wallet_add_screen.dart';
import 'package:bank_ui/pages/wallet/widgets/wallet_card.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final controller = Get.put(WalletController());

  void removeWallet(id) {
    controller.deleteWallet(id);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.wallet,
                                  color: primaryColor,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Payou Balance",
                                  style: GoogleFonts.coiny(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${controller.totalBalance.value}.000 vnd',
                              style: GoogleFonts.coiny(fontSize: 28),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const AddWalletScreen());
                          },
                          child: Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 211, 230, 255)
                                          .withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.add,
                              color: primaryColor,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "List Wallets",
                          style: GoogleFonts.notoSansMongolian(fontSize: 18),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.deleteAllWallet();
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    controller.wallets.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.wallets.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(AddWalletScreen(
                                      id: controller.wallets[index].id,
                                      name: controller.wallets[index].name,
                                      balance:
                                          controller.wallets[index].balance,
                                      color: controller.wallets[index].color,
                                    ));
                                  },
                                  child: WalletCard(
                                    id: controller.wallets[index].id,
                                    name: controller.wallets[index].name,
                                    balance:
                                        "\$${controller.wallets[index].balance!}",
                                    background: colors[
                                        controller.wallets[index].color!],
                                  ),
                                ),
                              );
                            })
                        : SizedBox(
                            height: height / 2,
                            child: Center(
                              child: Text(
                                "Empty Wallet",
                                style: GoogleFonts.coiny(
                                    fontSize: 20,
                                    color:
                                        const Color.fromARGB(255, 87, 87, 87)),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
