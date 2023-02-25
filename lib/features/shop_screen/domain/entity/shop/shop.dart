import 'package:hive/hive.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';

part 'shop.g.dart';

/// Shop.
@HiveType(typeId: 0)
class Shop extends HiveObject {
  /// Shop id.
  @HiveField(0)
  late int id;

  /// Shop name.
  @HiveField(1)
  late String shopName;

  /// List of products.
  @HiveField(2)
  late List<Product?> productList;

  /// Shop description.
  @HiveField(3)
  late String shopDescription;

  Shop({
    required this.id,
    required this.shopName,
    required this.productList,
    required this.shopDescription,
  });
}
