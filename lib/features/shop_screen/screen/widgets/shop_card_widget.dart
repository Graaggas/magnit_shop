import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/screen/widgets/product_card_widget.dart';

class ShopCardWidget extends StatelessWidget {
  final bool isFilterUsed;
  final Shop shop;
  final Function(Shop) onShopTap;
  final Function(Product) onProductTap;

  const ShopCardWidget({
    required this.shop,
    required this.isFilterUsed,
    required this.onShopTap,
    required this.onProductTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      color: Colors.green[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        radius: 20,
        onTap: isFilterUsed ? null : () => onShopTap(shop),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              color: Colors.green[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  shop.shopName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              thickness: 2,
              indent: 5,
              endIndent: 5,
            ),
            const SizedBox(height: 8),
            shop.productList.isEmpty
                ? const SizedBox.shrink()
                : Flexible(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: shop.productList.length,
                      itemBuilder: (_, prodIndex) {
                        final product = shop.productList[prodIndex];
                        return product == null
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductCardWidget(
                                  product: product,
                                  isFilterUsed: isFilterUsed,
                                  onProductTap: onProductTap,
                                ),
                              );
                      },
                    ),
                  ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
