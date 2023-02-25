import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_details/screen/shop_details_screen_wm.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              wm.shopDescription,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              color: Colors.green[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  wm.shopName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
