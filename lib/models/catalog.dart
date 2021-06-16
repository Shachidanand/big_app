class CatalogModel{
  static final items = [
  Item(
    id: 1,
    bm: "BM10001",
    name: "Big Choice White Soya 1 kg",
    price: 999,
    division: "Bakery",
    discount: 20,
    mrp: 1050,
    color: "#33505a",
    image:
        "https://static-01.daraz.com.np/p/b1cb64507a62dfa3ffeb7cea7978535c.jpg_340x340q80.jpg_.webp",
  )
];
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
}


