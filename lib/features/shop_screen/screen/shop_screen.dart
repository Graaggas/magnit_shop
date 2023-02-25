import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen_wm.dart';
import 'package:magnit_shop/features/shop_screen/screen/widgets/filter_textfield_widget.dart';
import 'package:magnit_shop/features/shop_screen/screen/widgets/show_card_widget.dart';
import 'package:magnit_shop/features/shop_screen/shop_screen_string.dart';

// Toolbar height = 40 (height of one textfield) * 2 + 8 (sizedBox) * 3 = 104
const _toolbarHeight = 104.0;

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
        toolbarHeight: _toolbarHeight,
        actions: [
          SizedBox(
            height: 16,
            child: TextButton(
              onPressed: () {},
              child: IconButton(
                  splashRadius: 32,
                  onPressed: wm.onFilterTap,
                  icon: const Icon(
                    Icons.filter_alt,
                    color: Colors.black45,
                  )),
            ),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            FilterTextField(
              hintText: ShopScreenString.filterByProduct,
              controller: wm.productFilteringController,
            ),
            const SizedBox(height: 8),
            const FilterTextField(hintText: ShopScreenString.filterByParameter),
            const SizedBox(height: 8),
          ],
        ),
      ),
      body: EntityStateNotifierBuilder<List<Shop>>(
        listenableEntityState: wm.shopEntityState,
        loadingBuilder: (_, __) => const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, __, ___) => const Center(
          child: Text(ShopScreenString.errorLoadingTitle),
        ),
        builder: (_, shops) {
          if (shops == null) {
            return const Center(
              child: Text(ShopScreenString.emptyDatabaseTitle),
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
