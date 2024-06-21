class TransactionModel {
  int? id;
  int? fromWalletId;
  String? fromWalletName;
  int? toWalletId;
  String? toWalletName;
  int? balance;
  int? categoryId;
  String? categoryName;
  String? dateTime;

  TransactionModel(
      {this.id,
      this.fromWalletId,
      this.fromWalletName,
      this.toWalletId,
      this.toWalletName,
      this.balance,
      this.categoryId,
      this.categoryName,
      this.dateTime});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fromWalletId": fromWalletId,
      "fromWalletName": fromWalletName,
      "toWalletId": toWalletId,
      "toWalletName": toWalletName,
      "balance": balance,
      "categoryId": categoryId,
      "categoryName": categoryName,
      "dateTime": dateTime,
    };
  }
}
