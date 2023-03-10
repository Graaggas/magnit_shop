import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';

/// Interface for [ShopRepository].
abstract class IShopRepository {
  /// Init data.
  Future<void> initTestData();

  /// Fetch shops.
  Future<List<Shop>> fetchShops(String? productFilter, String? parameterFilter);
}
