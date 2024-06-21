class Wallet {
  int? id;
  String? name;
  String? balance;
  int? color;

  Wallet({
    this.id,
    this.name,
    this.balance,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "balance": balance,
      "color": color,
    };
  }
}
