import 'package:bank_ui/models/wallet_model.dart';
import 'package:bank_ui/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database_helper/database_helper.dart';

class WalletController extends GetxController {
  final walletName = TextEditingController();
  final walletBalance = TextEditingController();
  RxInt selectedColor = 0.obs;
  RxInt totalBalance = 0.obs;

  var wallets = <Wallet>[].obs;

  @override
  void onInit() {
    getAllWallets();
    super.onInit();
  }

  bool isEmpty() {
    if (wallets.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void addWalletToDatabase() async {
    String name = walletName.text;
    String balance = walletBalance.text;
    Wallet wallet =
        Wallet(name: name, balance: balance, color: selectedColor.value);

    await DatabaseHelper.instance.addWallet(wallet);
    walletName.text = "";
    walletBalance.text = "";
    selectedColor.value = 0;
    getAllWallets();
    Get.back();
  }

  void updateWallet(int id) async {
    final name = walletName.text;
    final balance = walletBalance.text;

    Wallet wallet = Wallet(
      id: id,
      name: name,
      balance: balance,
      color: selectedColor.value,
    );
    await DatabaseHelper.instance.updateWallet(wallet);
    walletName.text = "";
    walletBalance.text = "";
    selectedColor.value = 0;
    getAllWallets();
    Get.back();
  }

  void deleteWallet(int id) async {
    Wallet wallet = Wallet(
      id: id,
    );
    await DatabaseHelper.instance.deleteWallet(wallet);
    getAllWallets();
    Get.back();
  }

  void deleteAllWallet() async {
    await DatabaseHelper.instance.deleteAllWallets();
    getAllWallets();
    getTotalBalance();
  }

  void getAllWallets() async {
    wallets.value = await DatabaseHelper.instance.getWalletList();
    getTotalBalance();
    update();
  }

  void getTotalBalance() {
    totalBalance.value = 0;
    for (var element in wallets) {
      totalBalance.value += int.parse(element.balance!);
    }
  }
}
