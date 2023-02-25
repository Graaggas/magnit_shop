import 'package:elementary/elementary.dart';
import 'package:magnit_shop/features/shop_details/screen/shop_details_screen.dart';
import 'package:magnit_shop/features/shop_details/screen/shop_details_screen_model.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';

/// Factory for [ShopDetailsScreenWM].
ShopDetailsScreenWM createShopDetailsScreenWM(Shop shop) => ShopDetailsScreenWM(
      model: ShopDetailsScreenModel(),
      shop: shop,
    );

/// Widget model for [ShopDetailsScreen].
class ShopDetailsScreenWM extends WidgetModel<ShopDetailsScreen, ShopDetailsScreenModel>
    implements IShopDetailsScreenWM {
  final Shop _shop;

  @override
  String get shopName => _shop.shopName;

  @override
  String get shopDescription => _shop.shopDescription;

  ShopDetailsScreenWM({required ShopDetailsScreenModel model, required Shop shop})
      : _shop = shop,
        super(model);
}

/// Interface for [ShopDetailsScreenWM].
abstract class IShopDetailsScreenWM {
  /// Shop name.
  String get shopName;

  /// Shop description.
  String get shopDescription;
}
