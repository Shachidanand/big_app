import 'package:big_app/models/cart.dart';
import 'package:big_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModal cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModal();
    cart.catalog = catalog;
  }
}
