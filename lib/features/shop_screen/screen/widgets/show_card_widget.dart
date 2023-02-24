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
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: shops.length,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => onShopTap(shops[index]),
          child: Card(
            color: Colors.grey[300],
            elevation: 1,
            child: SizedBox(
              height: 64,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(shops[index].shopName),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: shops[index].productList.length,
                        itemBuilder: (_, indexProduct) => Text(
                          shops[index].productList[indexProduct]?.productName ?? '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
