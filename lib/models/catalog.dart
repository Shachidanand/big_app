class CatalogModel {
  static List<Item> items = [];
}

class Item {
  final num id;
  final String bm;
  final String name;
  final String image;
  final num price;
  final String division;
  final num discount;
  final num mrp;
  final String color;

  Item(
      {required this.id,
      required this.bm,
      required this.name,
      required this.image,
      required this.price,
      required this.division,
      required this.discount,
      required this.mrp,
      required this.color});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      bm: map["bm"],
      name: map["name"],
      image: map["image"],
      price: map["price"],
      division: map["division"],
      discount: map["discount"],
      mrp: map["mrp"],
      color: map["color"],
    );
  }

  toMap() => {
        "id": id,
        "bm": bm,
        "name": name,
        "image": image,
        "price": price,
        "division": division,
        "discount": discount,
        "mrp": mrp,
        "color": color,
      };
}
