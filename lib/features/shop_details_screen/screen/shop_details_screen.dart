import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_details_screen/screen/shop_details_screen_wm.dart';

/// Screen for one shop.
class ShopDetailsScreen extends ElementaryWidget<ShopDetailsScreenWM> {
  const ShopDetailsScreen({
    Key? key,
    required WidgetModelFactory<ShopDetailsScreenWM> wmFactory,
  }) : super(
          wmFactory,
          key: key,
        );

  @override
  Widget build(IShopDetailsScreenWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('SHOP DETAILS'),
      ),
    );
  }
}
