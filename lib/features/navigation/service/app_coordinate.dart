import 'package:magnit_shop/features/product_details/screen/product_details_screen.dart';
import 'package:magnit_shop/features/product_details/screen/product_details_screen_wm.dart';
import 'package:magnit_shop/features/shop_details/screen/shop_details_screen.dart';
import 'package:magnit_shop/features/shop_details/screen/shop_details_screen_wm.dart';
import 'package:magnit_shop/features/navigation/domain/entity/coordinate.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen.dart';

/// A set of routes for the entire app.
class AppCoordinates implements Coordinate {
  /// Initialization screens([InitScreen]).
  static const initScreen = AppCoordinates._('shops_list');

  static const shopDetailsScreen = AppCoordinates._('shop_details');
  static const productDetailsScreen = AppCoordinates._('product_details');

  final String _value;

  const AppCoordinates._(this._value);

  @override
  String toString() => _value;
}

/// List of main routes of the app.
final Map<AppCoordinates, CoordinateBuilder> appCoordinates = {
  AppCoordinates.initScreen: (_, __) => const ShopScreen(),
  AppCoordinates.shopDetailsScreen: (_, args) {
    return ShopDetailsScreen(
      wmFactory: (_) => createShopDetailsScreenWM(args as Shop),
    );
  },
  AppCoordinates.productDetailsScreen: (_, args) {
    return ProductDetailsScreen(
      wmFactory: (_) => createProductDetailsScreenWM(args as Product),
    );
  },
};
