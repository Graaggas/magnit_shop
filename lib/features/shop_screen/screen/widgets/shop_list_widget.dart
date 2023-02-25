import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/screen/widgets/shop_card_widget.dart';

class ShopListWidget extends StatelessWidget {
  final List<Shop> shops;
  final Function(Shop) onShopTap;
  final Function(Product) onProductTap;
  final ValueListenable<bool> ifFilterUsedState;

  const ShopListWidget({
    required this.shops,
    required this.onShopTap,
    required this.onProductTap,
    required this.ifFilterUsedState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return shops.isEmpty
        ? const SizedBox.shrink()
        : ValueListenableBuilder<bool>(
            valueListenable: ifFilterUsedState,
            builder: (_, isFilterUsed, __) => ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              itemCount: shops.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, shopIndex) {
                final shop = shops[shopIndex];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopCardWidget(
                      shop: shop,
                      isFilterUsed: isFilterUsed,
                      onShopTap: onShopTap,
                      onProductTap: onProductTap),
                );
              },
            ),
          );
  }
}
