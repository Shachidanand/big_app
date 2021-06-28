class CatalogModel {
  // static final catModel = CatalogModel._internal();

  // CatalogModel._internal();

  // factory CatalogModel() => catModel;

  static List<Item> items = [];

  /// GET ELEMENT BY ID
  Item getById(int id) => items.firstWhere((element) => element.id == id);

  ///// GET BY POSITION
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String bm;
  final String name;
  final String desc;
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
      required this.desc,
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
      desc: map["desc"],
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
        "desc": desc,
        "image": image,
        "price": price,
        "division": division,
        "discount": discount,
        "mrp": mrp,
        "color": color,
      };
}
