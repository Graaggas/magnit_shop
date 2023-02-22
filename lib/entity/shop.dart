import 'package:magnit_shop/entity/product.dart';

/// Shop.
class Shop {
  /// Shop id.
  final int id;

  /// Shop name.
  final String shopName;

  /// List of products.
  final List<Product> productList;

  /// Constructor for [Shop].
  const Shop({
    required this.id,
    required this.shopName,
    required this.productList,
  });
}
