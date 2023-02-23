import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/app/di/app_scope.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [ShopScreenWM].
ShopScreenWM createShopScreenWM(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = ShopScreenModel();

  return ShopScreenWM(model: model);
}

/// Widget model for [ShopScreen].
class ShopScreenWM extends WidgetModel<ShopScreen, ShopScreenModel>
    implements IShopScreenWM {
  ShopScreenWM({required ShopScreenModel model}) : super(model);
}

/// Interface for [ShopScreenWM].
abstract class IShopScreenWM {}
