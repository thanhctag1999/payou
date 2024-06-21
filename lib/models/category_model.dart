class Category {
  int? id;
  String? name;
  String? type;
  int? color;

  Category({
    this.id,
    this.name,
    this.type,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "color": color,
    };
  }
}
