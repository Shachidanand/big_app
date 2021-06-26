import 'package:big_app/models/catalog.dart';

class CartModal {
  static final cartModel = CartModal._internal();

  CartModal._internal();

  factory CartModal() => cartModel;
  // catalog fields
  late CatalogModel _catalog;

  /// collection of ids -stored ids of items
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    // ignore: unnecessary_null_comparison
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  // get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// ADD ITEM
  void add(Item item) {
    _itemIds.add(item.id);
  }

  ///// REMOVE ITEM
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
