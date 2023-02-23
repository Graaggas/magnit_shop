import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen_wm.dart';

/// Screen for shops.
class ShopScreen extends ElementaryWidget<ShopScreenWM> {
  const ShopScreen({
    Key? key,
    WidgetModelFactory wmFactory = createShopScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ShopScreenWM wm) {
    throw Container();
  }
}
