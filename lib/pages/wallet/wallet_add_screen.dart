import 'package:bank_ui/controllers/wallet_controller.dart';
import 'package:bank_ui/widgets/constant.dart';
import 'package:bank_ui/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWalletScreen extends StatefulWidget {
  const AddWalletScreen(
      {super.key, this.name, this.balance, this.id, this.color});
  final id;
  final name;
  final balance;
  final color;

  @override
  State<AddWalletScreen> createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends State<AddWalletScreen> {
  final WalletController controller = Get.find();

  @override
  void initState() {
    controller.walletName.text = widget.name ?? "";
    controller.walletBalance.text = widget.balance ?? "";
    controller.selectedColor.value = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
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
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          widget.id != null
                              ? Text(
                                  "Edit wallet",
                                  style: GoogleFonts.coiny(fontSize: 26),
                                )
                              : Text(
                                  "Add new wallet",
                                  style: GoogleFonts.coiny(fontSize: 26),
                                )
                        ],
                      ),
                      widget.id != null
                          ? GestureDetector(
                              onTap: () {
                                controller.deleteWallet(widget.id);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 219, 233, 253)
                                          .withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: primaryColor,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 219, 233, 253)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.wallet,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wallet Name",
                            style: GoogleFonts.coiny(fontSize: 18),
                          ),
                          SizedBox(
                            width: width / 2 + 100,
                            child: TextField(
                              enableInteractiveSelection: true,
                              textCapitalization: TextCapitalization.words,
                              cursorColor: primaryColor,
                              controller: controller.walletName,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                hintText: 'Wallet name',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 219, 233, 253)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.price_change,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wallet Balance",
                            style: GoogleFonts.coiny(fontSize: 18),
                          ),
                          SizedBox(
                            width: width / 2 + 100,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: primaryColor,
                              controller: controller.walletBalance,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                hintText: 'Wallet balance',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Wallet Color",
                    style: GoogleFonts.coiny(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedColor.value = index;
                              },
                              child: Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: colors[index],
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: controller.selectedColor.value ==
                                              index
                                          ? Colors.black
                                          : Colors
                                              .white, // Change to your desired border color
                                      width:
                                          2.0, // Change to your desired border width
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (controller.walletName.text.isEmpty) {
                          showToast(message: "Wallet name is empty");
                        } else if (controller.walletBalance.text.isEmpty) {
                          showToast(message: "Wallet balance is empty");
                        } else {
                          widget.id != null
                              ? controller.updateWallet(widget.id)
                              : controller.addWalletToDatabase();
                        }
                      },
                      child: Container(
                        width: width / 2,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Save",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.coiny(
                              fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
