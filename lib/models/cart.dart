import 'package:big_app/core/store.dart';
import 'package:big_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModal {
  // static final cartModel = CartModal._internal();

  // CartModal._internal();

  // factory CartModal() => cartModel;
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

  num get totalDiscount =>
      items.fold(0, (discount, current) => discount + current.discount);

  // /// ADD ITEM
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // ///// REMOVE ITEM
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
