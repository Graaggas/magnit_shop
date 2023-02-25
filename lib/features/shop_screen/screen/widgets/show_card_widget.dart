import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';

class ShopCard extends StatelessWidget {
  final List<Shop> shops;
  final Function(Shop) onShopTap;
  const ShopCard({
    required this.shops,
    required this.onShopTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return shops.isEmpty
        ? const SizedBox.shrink()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: shops.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, shopIndex) {
              final shop = shops[shopIndex];
              return GestureDetector(
                onTap: () => onShopTap(shop),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: Colors.green[100],
                  elevation: 1,
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
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(product.productName),
                                              Flexible(
                                                child: ListView.builder(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: product.parameterList.length,
                                                  itemBuilder: (_, paramIndex) {
                                                    final parameter =
                                                        product.parameterList[paramIndex];
                                                    return parameter == null
                                                        ? const SizedBox.shrink()
                                                        : Text(product
                                                                .parameterList[paramIndex]?.name ??
                                                            '');
                                                  },
                                                ),
                                              ),
                                            ],
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
            },
          );
  }
}
