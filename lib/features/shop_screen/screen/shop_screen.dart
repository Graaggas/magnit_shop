import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen_wm.dart';
import 'package:magnit_shop/features/shop_screen/screen/widgets/filter_textfield_widget.dart';
import 'package:magnit_shop/features/shop_screen/screen/widgets/show_card_widget.dart';

/// Screen for shops.
class ShopScreen extends ElementaryWidget<ShopScreenWM> {
  const ShopScreen({
    Key? key,
    WidgetModelFactory wmFactory = createShopScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IShopScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 104,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(height: 8),
            FilterTextField(
              hintText: 'Фильтрация по товару',
            ),
            SizedBox(height: 8),
            FilterTextField(
              hintText: 'Фильтрация по характеристике',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
      body: EntityStateNotifierBuilder<List<Shop>>(
        listenableEntityState: wm.shopEntityState,
        loadingBuilder: (_, __) => const CircularProgressIndicator(),
        errorBuilder: (_, __, ___) => const Center(
          child: Text('Error loading'),
        ),
        builder: (_, shops) {
          if (shops == null) {
            return const Center(
              child: Text('data is null'),
            );
          }

          return Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: ShopCard(
                  shops: shops,
                  onShopTap: wm.onShopCardTap,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
